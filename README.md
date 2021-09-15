# blender

This module installs the Blender 3D modelling tool either from the package
repository of the client distribution or by downloading it from Blender's
website.

## Table of Contents

1. [Description](#description)
1. [Setup – The basics of getting started with blender](#setup)
    * [What blender affects](#what-blender-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with blender](#beginning-with-blender)
1. [Usage – Configuration options and additional functionality](#usage)
1. [Limitations – OS compatibility, etc.](#limitations)
1. [Development – Guide for contributing to the module](#development)

## Description

This module installs Blender on the target systems. The module supports two ways
of installation: the first one is installing the `blender` package from the
package repository of the target distribution. The second option is downloading
a specific version from the Blender website and dropping it to `/usr/local`. The
latter variant also allows for installing multiple versions as the module
creates symlinks to the binaries that include the version number.

## Setup

### Beginning with blender

The most basic installation is using the package manager to intall blender. This
can be achieved by using

```puppet
include blender
```

## Usage

The first option is installing Blender from the package repository of the
distribution using 

```puppet
include blender
```

This method provides no means of customising which version is installed – you
get what is in the repository.

The second option is specifying a hash of one or more versions of Blender to
be downloaded from Blender's website. This way of installing is used when the
`download_versions` hash is not empty. For instance, the following installs
Blender 2.93.4 without any further customisation

```puppet
class { 'blender':
    download_versions => {
        '2.93.4' => { }
    }
}
```

Please note that the full version number (major, minor and revision) needs to
be specified as this information is used to determine the download URL.

If this method of installation is chosen, you can further customise the
installation by specifying packages that need to be installed for Blender to
run in the `download_dependencies` parameter and you can customise the location
where Blender is extracted to via the `download_destination` parameter.

## Limitations
This module is only compatible with the distributions listed in `metadata.json`.

## Development

Open a pull request on [GitHub](https://github.com/UniStuttgart-VISUS/visus-blender).

