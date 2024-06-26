---
title: dfr to-parquet
categories: |
  dataframe
version: 0.92.0
dataframe: |
  Saves dataframe to parquet file.
usage: |
  Saves dataframe to parquet file.
feature: dataframe
---
<!-- This file is automatically generated. Please edit the command in https://github.com/nushell/nushell instead. -->

# `dfr to-parquet` for [dataframe](/commands/categories/dataframe.md)

<div class='command-title'>Saves dataframe to parquet file.</div>

::: warning
Dataframe commands were not shipped in the official binaries by default, you have to build it with `--features=dataframe` flag
:::

## Signature

```> dfr to-parquet {flags} (file)```

## Parameters

 -  `file`: file path to save dataframe


## Input/output types:

| input | output |
| ----- | ------ |
| any   | any    |

## Examples

Saves dataframe to parquet file
```nu
> [[a b]; [1 2] [3 4]] | dfr into-df | dfr to-parquet test.parquet

```
