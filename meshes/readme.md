# Mesh exporting

A couple of preoperties need to be fixed after exporting meshes from 3DS Max. Check the following in nifskope:

[] Emissive multiple **and** alpha set to 1 on `BSLightingShaderProperty` for all meshes
[] For boots, steel plate, and gauntlets bracers: set `has tangents` and `has vertex colors` to true; add `vertex colors` to shader flags 2
[] Set `environment map scale` to 0.5 for gauntlets bracers
[] Update all tangent spaces
