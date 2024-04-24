vec3 directionalLight(vec3 lightColor, float lightIntensity, vec3 normal, vec3 lightPosition, vec3 viewDirection, float specularPower) {

    vec3 lightDirection = normalize(lightPosition);
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

    return lightColor * lightIntensity * (shading + specular);
}
