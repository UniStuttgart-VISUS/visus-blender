# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`blender`](#blender): Installs Blender.

### Defined types

* [`blender::download`](#blenderdownload): Installs Blender from the Blender website.
* [`blender::repo`](#blenderrepo): Installs Blender from the software repository of the OS.

## Classes

### <a name="blender"></a>`blender`

Installs the 3D creation tool Blender.

#### Examples

##### Install the version of Blender that is available in the OS package repo.

```puppet
include blender
```

##### Install Blender 2.93.4 from the Blender website.

```puppet
class { 'blender':
    download_versions => {
        '2.93.4' => { }
    }
}
```

#### Parameters

The following parameters are available in the `blender` class:

* [`download_version`](#download_version)
* [`download_dependencies`](#download_dependencies)
* [`download_destination`](#download_destination)
* [`download_versions`](#download_versions)

##### <a name="download_version"></a>`download_version`

If not empty, instructs the module to install the
specified (full) version Blender from the Blender
website. Attributes in the hash are the parameters for
the blender::download resource.

##### <a name="download_dependencies"></a>`download_dependencies`

Data type: `Array[String]`

A list of packages to be installed if Blender is
downloaded from blender.org. This parameter has
no effect if Blender is installed from the
package repository. Defaults are provided via
Hiera.

Default value: `[]`

##### <a name="download_destination"></a>`download_destination`

Data type: `String`

The folder where downloaded versions of Blender
are installed. This parameter has no effect if
Blender is installed from the package repository.

##### <a name="download_versions"></a>`download_versions`

Data type: `Hash[String, Hash[String, Variant[String, Integer, Boolean]]]`



Default value: `{ }`

## Defined types

### <a name="blenderdownload"></a>`blender::download`

Installs Blender from the Blender website.

#### Parameters

The following parameters are available in the `blender::download` defined type:

* [`dependencies`](#dependencies)
* [`destination`](#destination)
* [`source`](#source)
* [`version`](#version)

##### <a name="dependencies"></a>`dependencies`

Data type: `Array[String]`

A list of packages that need to be installed in order for
Blender to work. This is usually provided via Hiera.

##### <a name="destination"></a>`destination`

Data type: `String`

The directory to install Blender to.

##### <a name="source"></a>`source`

Data type: `Optional[String]`

The URL to retrieve Blender from. If not set, the URL will be
composed from the requested version.

Default value: ``undef``

##### <a name="version"></a>`version`

Data type: `String`

The (full) version of Blender to be installed. This is required
to determine the download URL automatically and to decide on
the installation location including the symlink in
'/usr/local/bin'.

### <a name="blenderrepo"></a>`blender::repo`

Installs Blender from the software repository of the OS.

#### Parameters

The following parameters are available in the `blender::repo` defined type:

* [`package`](#package)

##### <a name="package"></a>`package`

Data type: `String`

The name of the Blender package, which defaults to 'blender'.

Default value: `'blender'`
