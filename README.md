# Modular curves X<sub>0</sub>(N) of density degree 5

This repository contains code accompanying the paper "Modular curves X<sub>0</sub>(N) of density degree 5".

# Dependencies

- Magma (v2.29-4)
- GP/PARI CALCULATOR Version 2.17.2
- SageMath 10.5
- Maple (2024)
- [MDSage v0.1.0](https://github.com/koffie/mdsage)
- QuadraticPoints (included as git submodule)
- GNU Parallel

# Installation

Make sure that you have Magma and PARI/GP installed.
Installation is as easy as cloning this repository. Make sure that you use the `--recurse-submodules` option
to ensure that the `QuadraticPoints` dependency is downlaoded as well.
```bash
git clone --recurse-submodules https://github.com/nt-lib/density-degree-5-X0
```

# Reproducing the computations

## Magma

In order to reproduce the magma computations simply run

```bash
./verify_magma.sh
```

from the root of this repository. This will use GNU Parallel to execute all the magma computations. Timing information and logs/outputs of
these computations will get written to the `logs` directory.

The magma computations can also be run individually by hand using for example

```
magma -n X0_112.m
```

## PARI/GP

We ran the PARI/GP computations using the PARI/GP that comes with SageMath. To reproduce them simply run

```
sage -gp modular_parameterisations.gp 
```

from the root of this directory. It is also possible to use PARI/GP directly if you have it installed outside of SageMath in the following way:

```
gp modular_parameterisations.gp
```


## SageMath

Since for SageMath we simply ran some earlier computations done for a different article up to a higher bound we decided to do those computations
in the original repository. Reproducing this computations is done by running the computations in [this ipython notebook](https://github.com/koffie/mdsage/blob/main/articles/derickx_orlic-quartic_X0/computational_proofs.ipynb). This requires [MDSage v0.1.0](https://github.com/koffie/mdsage) to be installed in your SageMath installation.

## Maple

The Maple computations are contained in the files `modular_parameterisation_112a2.mpl` and `modular_parameterisation_117a4.mpl`. To reproduce them simply run 
```bash
maple modular_parameterisation_112a2.mpl
maple modular_parameterisation_117a4.mpl
```

from the root of this repository.
