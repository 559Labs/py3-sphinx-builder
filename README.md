# py3-sphinx-builder

All the existing Spinx utility Docker images I could find use Python 2.7. Sometimes, your project requires some packages available only on the 3.x release. This is for those situations. Includes support for PlantUML.

It's based on the [sonodar/docker-sphinx-build](https://github.com/sonodar/docker-sphinx-build) image. However, this uses Ubuntu 18.04 as a base and Python 3.x instead.


## Running a Build

```bash
$ docker run -it --rm \
  -v "your_directory_on_host:/sphinx" \
  -e SPHINX_BUILDER=html \
  andrew559labs/py3-sphinx-builder
```

## Environment Variables

When you run the image, you can adjust the defaults of the instance by passing one or more environment variables on the docker run commandline.


### ```SPHINX_SRC_DIR```

Defaults to ```/sphinx/src```, but you can set a directory as needed.


### ```SPHINX_BUILD_DIR```

Defaults to ```/sphinx/build```, but you can set a directory as needed.

### ```SPHINX_BUILDER```

Defaults to ```html```, but also supports:

- pdf
- pdfja

### ```PIP_REQUIREMENTS_FILE```

By default, the image will look for a ```requirements.txt``` in the current directory. If it finds it, then it installs them under Python3. You can specify a different file with this variable.
