# binary_CGH_By_LRDS_AIA


## Introduction

This project is the implementation for binary computer-generated holograms(CGH) with localized random down-sampling and adaptive intensity accumulation(AIA). A computer-generated complex Fresnel hologram is calculated by

$$ {H_c}(m,n) = \sum\limits_{x = 1}^X {\sum\limits_{y = 1}^Y {\frac{{O(x,y;z)}}{{r(m - x,n - y;z)}}\exp [{i{k_0}r(m - x,n - y;z) - i{\phi_r}(m,n)} ]} } ,
 $$
Subsequently, a binary hologram is obtained by applying sign-thresholding binarization on the complex hologram, given by

$$ {H_b}(m,n) = \left\{ {\begin{array}{c} {1,\quad {\rm Re} \{{{H_c}(m,n)} \}> 0}\\ {0,\quad \;\;\,otherwise.\quad \quad } \end{array}} \right.
$$
It should be noted that sign-thresholding binarization will produce serious error on the binary hologram. The error can be suppressed by down sampling the object [[1]](https://opg.optica.org/oe/fulltext.cfm?uri=oe-28-17-24526&id=434189#ref13). That is, the object function must be replaced by a down-sampled version of the object,

$${O_d}(x,y;z) = O(x,y;z)S(x,y),$$

where 𝑆(𝑥,𝑦) is the function of down-sampling mask. One of the simplest masks is a regular point down sampling (RPDS) mask, which is defined as

$${S_{rp}}(x,y) = \left\{ {\begin{array}{c} {1,\quad x = kp\; \cap \;y = kq}\\ {0,\,\,\,\;\,otherwise,\quad \quad } \end{array}} \right.$$

where 𝑝,𝑞∈1,2,3…, and k the down-sampling factor (an integer larger than one). The operator ∩ denotes the intersection of the two sets of data. Because only 1/𝑘2 over the total 𝑋𝑌 pixels are selected by 𝑆𝑟𝑝(𝑥,𝑦), the down sampling rate of 𝑆𝑟𝑝(𝑥,𝑦) is 𝑅=1/𝑘2. Equation (4) only defines a single down-sampling mask. We can just shift the down-sampling points to generate other down-sampling masks. By this way, total 𝑘2 various masks can be generated, as shown in Fig. 1(a). Nevertheless, the number of RPDS masks is still limited. This issue can be solved by localized random down-sampling (LRDS).


In LRDS, the object space is divided to many tiles, and each tile contains 𝑘×𝑘 pixels. Subsequently, one over the 𝑘2 points in the tile is randomly selected as the down-sampling point. Therefore, the down-sampling rate is also 𝑅=1/𝑘2. The LRDS mask can be modeled as

$${S_{lr}}(x,y) = \left\{ {\begin{array}{c} {1,\quad x = kp - {\tau_a}\; \cap \;y = kq - {\tau_b}}\\ {0,\,\,\,\;otherwise,\quad \quad \quad \quad \,\,\,\,\quad } \end{array}} \right.$$

where both 𝜏𝑎 and 𝜏𝑏 are random integer and 0≤𝜏𝑎,𝜏𝑏≤𝑘−1. Therefore, for every (𝑝,𝑞), i.e. within a tile, a combination of (𝜏𝑎,𝜏𝑏) is randomly selected, as shown in Fig. 1(b). In this example, every point of a tile is selected once. However, there is no limitation on the selection rule and thus total 𝑘2𝑋𝑌/𝑘2 various masks can be generated. The LRDS mask also have other advantages. The periodic structure due to regular-point down-sampling is significantly suppressed. In addition, the random process is localized in a tile. Thus, the sample points distribute uniformly on the whole object plane, which is unachievable for conventional random down sampling. An example of RPDS mask and LRDS mask is shown in Fig. 2.













## Function description

`AIA.m` is the implementation for binary CGH reconstruction with localized random down-sampling and adaptive intensity accumulation(AIA).

`DIA.m` is the implementation for binary CGH reconstruction with localized random down-sampling and direct intensity accumulation(DIA).

`generate_LRDS.m` is the implementation for generate the localized random down-sampling mask, it will generate mask file(`LRDS.mat`).

### The **code** as the following structure

```
├── binary_CGH_By_LRDS_AIA
  ├── AIA.m
  ├── DIA.m
  ├── generate_LRDS.m
  ├── LRDS.mat 
  └── image.bmp
```