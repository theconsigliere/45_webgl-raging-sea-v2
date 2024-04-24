vec3 pointLight(vec3 lightColor, float lightIntensity, vec3 normal, vec3 lightPosition, vec3 viewDirection, float specularPower, vec3 position, float lightDecay) {

    vec3 lightDelta = lightPosition - position;
    float lightDistance = length(lightDelta);
    vec3 lightDirection = normalize(lightDelta);
    vec3 lightReflection = reflect(-lightDirection, normal);

    //shading
    // flipped the normals and it seemed to work
    float shading = dot(normal, lightDirection);
    // clamp shading so it doesn't go below 0
    shading = max(0.0, shading);

    // Specular
    float specular = - dot(lightReflection, viewDirection);
    // clamp specular so it doesn't go below 0
    specular = max(0.0, specular);
    specular = pow(specular, specularPower);


    // Decay
    float decay = 1.0 - lightDistance * lightDecay;
    decay = max(0.0, decay);

     return lightColor * lightIntensity * decay * (shading + specular);
}
