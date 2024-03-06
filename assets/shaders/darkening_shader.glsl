#version 330 core

precision mediump float;

uniform vec2 lightPosition; // The position of the light source
uniform float lightRadius; // The radius of the light source
uniform float darkness; // The level of darkness (0.0 - 1.0)

out vec4 fragColor; // Declare the output variable

void main() {
  vec2 uv = gl_FragCoord.xy / vec2(640.0, 480.0); // Normalize the coordinates
  float distance = distance(uv, lightPosition); // Calculate the distance from the light source
  float attenuation = smoothstep(lightRadius - 0.1, lightRadius, distance); // Smooth falloff
  fragColor = vec4(vec3(1.0 - darkness * attenuation), 1.0); // Assign the color to the output variable
}