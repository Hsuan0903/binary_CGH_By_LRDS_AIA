# binary_CGH_By_LRDS_AIA

<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192965108-68035be5-e150-4d72-8d17-149d53632bcd.png">
    
</p>





## Introduction


This project is the implementation for binary computer-generated holograms(CGH) with localized random down-sampling and adaptive intensity accumulation(AIA). A computer-generated complex Fresnel hologram is calculated by
<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962091-e7446909-8302-4d78-84f1-b6dfaeb18209.png">
</p>

Subsequently, a binary hologram is obtained by applying sign-thresholding binarization on the complex hologram, given by

<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962260-1e890fe6-f263-41c2-9ccb-d8c597202e9b.png">
</p>

It should be noted that sign-thresholding binarization will produce serious error on the binary hologram. The error can be suppressed by down sampling the object [ref](https://opg.optica.org/oe/fulltext.cfm?uri=oe-28-17-24526&id=434189#ref13). That is, the object function must be replaced by a down-sampled version of the object,
<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962325-3e6060b9-88ce-43b3-895e-1d5f2b44822a.png">
</p>
where 𝑆(𝑥,𝑦) is the function of down-sampling mask. One of the simplest masks is a regular point down sampling (RPDS) mask, which is defined as
<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962349-575ea449-35c0-4d1d-ba84-d4d6261283a1.png">
</p>

where 𝑝,𝑞∈1,2,3…, and k the down-sampling factor (an integer larger than one). The operator ∩ denotes the intersection of the two sets of data. Because only 1/𝑘2 over the total 𝑋𝑌 pixels are selected by 𝑆𝑟𝑝(𝑥,𝑦), the down sampling rate of 𝑆𝑟𝑝(𝑥,𝑦) is 𝑅=1/𝑘2. Equation (4) only defines a single down-sampling mask. We can just shift the down-sampling points to generate other down-sampling masks. By this way, total 𝑘2 various masks can be generated, as shown in Fig. 1(a). Nevertheless, the number of RPDS masks is still limited. This issue can be solved by localized random down-sampling (LRDS).
<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962456-95bd03ba-97f4-4dfe-b184-b0512706abac.jpg">
</p>

In LRDS, the object space is divided to many tiles, and each tile contains 𝑘×𝑘 pixels. Subsequently, one over the 𝑘2 points in the tile is randomly selected as the down-sampling point. Therefore, the down-sampling rate is also 𝑅=1/𝑘2. The LRDS mask can be modeled as


<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962527-ea4d0003-363b-45dc-85d1-7f9027a515f4.png">
</p>

where both 𝜏𝑎 and 𝜏𝑏 are random integer and 0≤𝜏𝑎,𝜏𝑏≤𝑘−1. Therefore, for every (𝑝,𝑞), i.e. within a tile, a combination of (𝜏𝑎,𝜏𝑏) is randomly selected, as shown in Fig. 1(b). In this example, every point of a tile is selected once. However, there is no limitation on the selection rule and thus total 𝑘2𝑋𝑌/𝑘2 various masks can be generated. The LRDS mask also have other advantages. The periodic structure due to regular-point down-sampling is significantly suppressed. In addition, the random process is localized in a tile. Thus, the sample points distribute uniformly on the whole object plane, which is unachievable for conventional random down sampling. An example of RPDS mask and LRDS mask is shown in figure.

<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962602-194f3df2-2ff5-46df-ab06-4e476b6289b4.jpg">
</p>

The flow chart of generating the binary holograms for AIA is shown in figure.


<p align="center" width="100%">
    <img width="66%" src="https://user-images.githubusercontent.com/67819957/192962874-5c27af1b-2946-4cf6-8754-4bb2459ad1ad.jpg">
</p>




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
