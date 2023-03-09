package My::EasterRock;

use strict;
use LWP::Simple;
use GD;
use HTML::Entities;

# How to use this module:
#
#   my $rock = EasterRock->new();
#   $rock->setTextSource($textSource);  # pass a URL
#   $rock->setImageSource($imageSource);  # pass a URL (jpg or png)
#   print $rock->getRock('html');  # html, style, div or config

# variables that need a default value
my $_textSource  = 'http://www.nu.nl';
my $_imageSource = 'http://juerd.nl/jn/onion.png';
my $_rockHeight  = 60;

# variables you could fill youself
my $_backgroundColor = '';
my $_characterAspectratio = 1.8;    # 2.0 = (line)heigth is twice the (character)width

# variables the program will fill
my $_textBuffer = '';
my $_rockWidth  = 60;
my $_sourceImageObject;
my $_patternImageObject;
my $_imageAspectratio = 1;

sub new {
    my $class = shift;
    my $self  = {};
    return bless $self, $class;
}

sub setTextSource {
    my $self = shift;
    $_textSource = shift;
}

sub setImageSource {
    my $self = shift;
    $_imageSource = shift;
}

sub loadText {
    my $self = shift;
    $_textBuffer = shift || get($_textSource);    # read a URL using LPW
    $_textBuffer =~ s/[\n\t\s]//g;    # get rid of spaces and stuff..
}

sub getLine {
    $_textBuffer =~ m/^(.{$_rockWidth})(.*)$/;
    $_textBuffer = $2;
    return $1;
}

sub loadImage {
    my $self = shift;
    if ( $_imageSource =~ m/^http.*/i ) {
        my $image_web = get($_imageSource);
        $_sourceImageObject = GD::Image->newFromJpegData($image_web)
          if ( $_imageSource =~ m/.*jpg$/i );
        $_sourceImageObject = GD::Image->newFromGifData($image_web)
          if ( $_imageSource =~ m/.*gif$/i );
        $_sourceImageObject = GD::Image->newFromPngData($image_web)
          if ( $_imageSource =~ m/.*png$/i );
    }
    else {
        $_sourceImageObject = GD::Image->newFromJpeg($_imageSource)
          if ( $_imageSource =~ m/.*jpg$/i );
        $_sourceImageObject = GD::Image->newFromGif($_imageSource)
          if ( $_imageSource =~ m/.*gif$/i );
        $_sourceImageObject = GD::Image->newFromPng($_imageSource)
          if ( $_imageSource =~ m/.*png$/i );
    }
    if ( !$_sourceImageObject ) {
        die(
            "loadImage() did not work out... (gif could be a problem)\n"
        );
    }
    my ( $width, $height ) = $_sourceImageObject->getBounds();
    $_imageAspectratio = $height / $width;
}

sub getPixelColor {
    my $self = shift;
    my ( $x, $y ) = @_;
    my $index = $_patternImageObject->getPixel( $x, $y );
    my ( $r, $g, $b ) = $_patternImageObject->rgb($index);
    return "rgb($r,$g,$b)";
}

sub adjustRockWidth {

    # here we use the aspectratio of the characters and
    # the aspectratio of the image to calculate the character width
    $_rockWidth =
      int( ( $_rockHeight / $_imageAspectratio ) * $_characterAspectratio );
    if ( $_rockWidth > 4 * $_rockHeight ) {
        $_rockHeight = int( $_rockHeight / 2 );
        $_rockWidth =
          int( ( $_rockHeight / $_imageAspectratio ) * $_characterAspectratio );
    }
}

sub resizeImage {

    # resize The image to match columns and rows
    $_patternImageObject = new GD::Image( $_rockWidth, $_rockHeight );
    my ( $width, $height ) = $_sourceImageObject->getBounds();
    $_patternImageObject->copyResized( $_sourceImageObject, 0, 0, 0, 0,
        $_rockWidth, $_rockHeight, $width, $height );
}

sub getRockHtml {
    my $self   = shift;
    my $_style = shift;
    my $_code  = shift;
    return qq|<html><head><meta http-equiv="Content-type" content="tex
t/html; charset=utf-8"><title>Easter Rock</title>$_style</head><body 
id="thePage">$_code</body></html>|;
}

sub getRockStyle {
    my $self = shift;
    if ( $_backgroundColor eq '' ) {
        $_backgroundColor = $self->getPixelColor( 1, 1 );
    }
    my $output = qq|<style type="text/css" media="screen">body { margi
n: 0; padding: 0; background-color: $_backgroundColor; } #theText { m
argin: 0; padding: 0; overflow: hidden; font-family: monospace; font-
size: 10px; line-height: 10px; color: black; } </style>|;
    return $output;
}

sub getRock {
    my $self   = shift;
    my $format = shift || 'html';    # html, style, div or config
    $self->loadText;
    $self->loadImage;
    $self->adjustRockWidth;
    $self->resizeImage;

    my $debuglog = '';
    $debuglog .=
      qq|We are going to build for $_rockWidth x $_rockHeight characters. \n|;
    $debuglog .=
      qq|The aspectratio of a character is $_characterAspectratio. \n|;
    $debuglog .=
      qq|The aspectratio of the source image is $_imageAspectratio. \n|;
    my ( $width, $height ) = $_patternImageObject->getBounds();
    $debuglog .= qq|The pattern image is $width x $height pixels. \n|;

    if ( $format eq 'config' ) { return $debuglog; }

    my $_style = $self->getRockStyle;
    if ( $format eq 'style' ) { return $_style; }

    my $_code = '';
    for ( my $i = 0 ; $i < $_rockHeight ; $i++ ) {
        my @letters = split( //, $self->getLine );
        for ( my $j = 0 ; $j < $_rockWidth ; $j++ ) {

            my $color = $self->getPixelColor( $j, $i );
            my $letter =
              ( $_backgroundColor eq $color )
              ? '&nbsp;'
              : encode_entities( $letters[$j] );

            while ( ( $j + 1 ) < $_rockWidth
                && $self->getPixelColor( $j, $i ) eq $color )
            {
                $j++;
                $letter .=
                  ( $_backgroundColor eq $color )
                  ? '&nbsp;'
                  : encode_entities( $letters[$j] );
            }
            $_code .= qq|<span style="color: $color">$letter</span>|;
        }
        $_code .= qq|<br />|;
    }
    $_code = qq|<div id="theText">$_code</div>|;
    if ( $format eq 'div' ) { return $_code; }

    return $self->getRockHtml( $_style, $_code );
}

1;
