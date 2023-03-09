=info
    Auth:523066680
    Date:2017-07
    https://www.shadertoy.com/view/ld2fzw

    按 '[' 和 ']' 调整阀值，按 - 和 = 调整迭代深度
    空格键 - 暂停/继续
    q or Q - 退出
=cut

use OpenGL qw/ :all /;
use OpenGL::Config;
use OpenGL::Shader;
use Time::HiRes 'sleep';
use feature 'state';
use IO::Handle;
STDOUT->autoflush(1);

our $ang = 0.0;
our $iter = 1000.0;
our $test = 80.0;
our ($cx, $cy);
our $vTest;
our $vIter;
our $vC;

our $PAUSE = 0;

&Main();

sub display 
{
    glClear(GL_COLOR_BUFFER_BIT);
    glDrawArrays(GL_POINTS, 0, 1);
    glutSwapBuffers();
}

sub idle 
{
    sleep 0.03;

    $ang += 0.05 if ($PAUSE == 0);
    $cx = cos($ang);
    $cy = sin($ang);

    glVertexAttrib2fARB($vC, $cx, $cy);

    glutPostRedisplay();
}

sub init 
{
    glClearColor(0.0, 0.0, 0.0, 1.0);
    my $shdr = new OpenGL::Shader('GLSL');
    my $ver  = $shdr->GetVersion();
    my $stat = $shdr->Load( frag_Shader(), vert_Shader() );
    $shdr->Enable();

    #如果 shader 编译不成功，错误信息会返回到 $stat
    print "$stat $ver\n";
    glPointSize(480.0);

    $vTest = $shdr->MapAttr('vTest');
    $vIter = $shdr->MapAttr('vIter');
    $vC    = $shdr->MapAttr('vC');

    glVertexAttrib1fARB($vTest, $test);
    glVertexAttrib1fARB($vIter, $iter);
    glVertexAttrib2fARB($vC, $cx, $cy);
}

sub hitkey 
{
    my $key = shift;
    my $char = chr($key);

    if ( lc($char) eq 'q' ) { glutDestroyWindow($WinID) } 
    elsif ($char eq '[')  { $test -= 1.0 if ( $test > 1.0 ) }
    elsif ($char eq ']')  { $test += 1.0 }
    elsif ($char eq '-')  { $iter -= $iter*0.2 if ( $iter > 1.0 ) }
    elsif ($char eq '=')  { $iter += $iter*0.2  }
    elsif ($char eq ' ')  { $PAUSE = 1 - $PAUSE }

    printf("test: %.2f, iter: %.2f\n", $test, $iter );
    glVertexAttrib1fARB($vTest, $test);
    glVertexAttrib1fARB($vIter, $iter);
}

sub Main 
{
    glutInit();
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE );
    glutInitWindowSize(1920, 1080);
    glutInitWindowPosition(2,2);
    our $WinID = glutCreateWindow("title");
    &init();
    glutDisplayFunc(\&display);
    glutKeyboardFunc(\&hitkey);
    glutIdleFunc(\&idle);
    glutMainLoop();
}

sub frag_Shader
{
    return '
    varying float fTest;
    varying float fIter;
    varying vec2 fC;

    void main(void)
    {
        vec2 coord = (gl_FragCoord.xy - 250.0) / 100.0;

        vec4 color;
        vec2 C = fC;
        vec2 Z = coord.xy;

        int iterations = 0;
        int max_iterations = int(fIter);

        float rate;
        float threshold_squared = fTest;

        while ( (iterations < max_iterations) && (dot(Z, Z) < threshold_squared) )
        {
            vec2 tZ;
            tZ.x = Z.x * Z.x - Z.y * Z.y + C.x;
            tZ.y = Z.x * Z.y * 2.0 + C.y;
            Z = tZ;
            iterations++;
        }

        if (iterations == max_iterations)
        {
            color = vec4(0.3, 0.1, 0.1, 1.0);
        }
        else
        {
            rate =  float(iterations)/float(max_iterations)*100.0;
            //color = vec4(rate, rate, rate, 1.0);
            color = vec4(rate, smoothstep(exp(Z.x), 0.0, 0.5), rate, 1.0);
        }

        gl_FragColor = color;
    }
    '
}

sub vert_Shader
{
    return '
    attribute float vTest;
    attribute float vIter;
    attribute vec2 vC;

    varying float fTest;
    varying float fIter;
    varying vec2 fC;

    void main(void)
    {
        fTest = vTest;
        fIter = vIter;
        fC    = vC;

        gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
    }
    ';
}
