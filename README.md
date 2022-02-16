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

The gridlabd run file `gridlabd.rc` must be uploaded. The format of the RC file is one line per
gridlabd command option, e.g., the command `gridlabd --verbose model.glm` should be entered as

~~~
--verbose
model.glm
~~~

Options may be provided together, e.g., `gridlabd -D csv_load_options="-f config" config.csv network.glm equipment.glm` should be entered as

~~~
-D csv_load_options="-f config"
config.csv
network.glm equipment.glm
~~~

All files referenced by the RC file, or by any file contained in the RC file must be uploaded as well.

OUTPUTS
-------

All files at the end of the run will be copied to the output folder, including the original input files.

CAVEATS
-------

1. A number of `gridlabd` capabilities require credentials.  These may not work unless the credentials are uploaded to the input files.

2. Unlike most OpenFIDO pipelines, this pipeline runs in the input folder.
