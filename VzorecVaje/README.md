# Vzorec vaje

V tem direktoriju je vzorec kode, kot jo bomo pisali na vajah. V julia REPL aktiviramo
projekt v tem direktoriju. To omogoča, da v julia REPL kličemo funkcije, ki so definirane
v direktoriju `src`. 

```
julia> # z vnosom znaka ] pridemo v "pkg" način
(@v1.10) pkg> activate VzorecVaje
```

## Testi

Teste poženemo, tako da pokličemo tako, da v `pkg` načinu poženemo ukaz `test`

```shell
(VzorecVaje) pkg> test

    Testing VzorecVaje
    ...
         Testing Running tests...
Test Summary:          | Pass  Total  Time
Linearna interpolacija |    1      1  0.0s
     Testing VzorecVaje tests passed 
```

oziroma v terminalu poženemo

```shell
julia --project="VzorecVaje" -e "import Pkg; Pkg.test()"
```

## Dokumentacija

Poročilo generiramo s paketom [Weave.jl](https://github.com/JunoLab/Weave.jl). Podrobnosti so v datoteki `makedocs.jl`.

```shell
$ cd docs
$ julia makedocks.jl
```

Zgornji ukaz iz komentarjev in kode v `demo.jl` generira PDF datoteko.