vec3 palette( in float t )
{

    vec3 a = vec3(0.520, 0.608, 0.608);
    vec3 b = vec3(0.219, 0.478, 0.480);
    vec3 c = vec3(0.750, 0.539, -1.929);
    vec3 d = vec3(-1.372, -1.038, -0.705);


    return a + b*cos( 6.283185*(c*t+d) );
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

   vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec2 uv0 = uv;
   uv = fract(uv * 1.7) -0.5;
    vec2 m =iMouse.xy/iResolution.xy;
   
   
    vec3 finalCol = vec3(0.0);

for(float i=0.0; i<2.0; i++)
{
float d = length(uv) * exp(-length(uv)) * (sign(tan(iTime))) * sin(iTime);
d = cos(d*16. + iTime )/16.;
d = abs(d);
vec3 col = palette(length(uv0) + i*.3 + .4*iTime);
d = pow(0.01/d,1.7);
finalCol += col * d ;

}

    fragColor = vec4(finalCol,1.0);
}
