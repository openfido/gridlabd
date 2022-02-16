OpenFIDO gridlabd pipeline
==========================

The `gridlabd` pipeline runs GridLAB-D.

PIPELINE
--------

Recommended pipeline settings:

| Setting                 | Recommended value
| ----------------------- | -----------------
| Pipeline name           | GridLAB-D
| Description             | Run GridLAB-D
| DockerHub Repository    | slacgismo/gridlabd:latest
| Git Clone URL (https)   | https://github.com/openfido/gridlabd
| Repository Branch       | main
| Entrypoint Script (.sh) | openfido.sh

INPUTS
------

The gridlabd run file `gridlabd.sh` must be upload. This file may contain any valid shell commands, but should include at least one call to gridlabd, e.g., using the syntax

~~~
gridlabd [OPTIONS] model.glm
~~~

Any other files references by the run file, or by any file contained in the run file must be uploaded as well.

OUTPUTS
-------

All files at the end of the run will be copied to the output folder, including the original input files.

CAVEATS
-------

1. A number of `gridlabd` capabilities require credentials.  These may not work unless the credentials are uploaded to the input files.

2. Unlike most OpenFIDO pipelines, this pipeline runs in the input folder.
