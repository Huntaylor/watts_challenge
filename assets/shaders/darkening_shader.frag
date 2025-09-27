#version 460 core

precision mediump float;

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec2 lightPosition; // The position of the light source
uniform float lightRadius; // The radius of the light source
uniform float darkness; // The level of darkness (0.0 - 1.0)

out vec4 fragColor; // Declare the output variable

void main() {
    vec2 pos = FlutterFragCoord().xy;
     vec2 uv = pos / uSize; // Normalize the coordinates
  float distance = distance(uv, lightPosition); // Calculate the distance from the light source
  float attenuation = smoothstep(lightRadius - 0.1, lightRadius, distance); // Smooth falloff
   float alpha = darkness * attenuation;
  fragColor = vec4(vec3(alpha - darkness * attenuation), alpha); // Assign the color to the output variable
} 