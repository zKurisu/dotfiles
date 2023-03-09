use strict;
use warnings;

my $latex_code = '\documentclass{article}
\begin{document}
Hello, World!
\end{document}';

# Write the LaTeX code to a file
open my $fh, '>', 'hello.tex' or die $!;
print $fh $latex_code;
close $fh;

# Compile the LaTeX code to a PDF
system 'pdflatex', 'hello.tex';

# Read the PDF content
open $fh, '<', 'hello.pdf' or die $!;
binmode $fh;
my $pdf_content = do { local $/; <$fh> };
close $fh;

# Output the PDF content
print $pdf_content;
