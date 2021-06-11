# Image Histogram Processing
In this part, I'm gonna walk through more about histograms, how it relates to image processing, and image enhancements. All types of histogram are also gonna be performed pixel-wise on images of dimension <!-- $M * N$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=M%20*%20N">.

Any image has an equivalence histogram defined as following:

1. Let <!-- $r_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_k">, for <!-- $k = 1, 2, ..., L-1$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=k%20%3D%201%2C%202%2C%20...%2C%20L-1"> denote the intensity values of each pixel of a digital input image <!-- $f(x,y)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=f(x%2Cy)">.
2. The _unnormalized histogram_ of <!-- $f$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=f"> defined as <!-- $h(r_k) = n_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=h(r_k)%20%3D%20n_k"> where <!-- $n_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=n_k"> is the number of pixels in the image with intensity value <!-- $r_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_k">.
3. The corresponding _normalized histogram_ of an image <!-- $f$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=f"> is to take the propabilities of the intensity values in the image and it's defined as 

<!-- $$
p(r_k) = \frac{h(r_k)}{MN} = \frac{n_k}{MN}
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=p(r_k)%20%3D%20%5Cfrac%7Bh(r_k)%7D%7BMN%7D%20%3D%20%5Cfrac%7Bn_k%7D%7BMN%7D"></div>

where <!-- $p(r_k)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=p(r_k)"> called **PDF** _Propability Distribution Function_.

After plotting the intensity values and their corresponding probabilities you shall find that images with dark intensity have more bins close to 0 (right-skewed), the light images have more bins close to 1 (left-skewed), low-contrast images have more bins in the middle (centered shape), and the high-contrast images have equal-sized bins distributed between 0 and 1.

---

## Histogram Equalization (Linearization)
This type of processing has the general tendency to spread the histogram of the input image so that the intensity values of the equalized image span a wider range of the intensity scale.

The transformation function is of the form:

<!-- $$
s_k = T(r_k) = (L-1) \displaystyle\sum_{i=1}^{k} p_r(r_i) 
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=s_k%20%3D%20T(r_k)%20%3D%20(L-1)%20%5Cdisplaystyle%5Csum_%7Bi%3D1%7D%5E%7Bk%7D%20p_r(r_i)%20"></div>

where <!-- $s_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_k"> is the equalized pixel corresponding to intensity value <!-- $k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=k"> and <!-- $L$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=L"> is the numbe rof possible intensity levels in the image _(e.g. 256 for an 8-bit image)_.

> Note that, the original transformation function for continous values uses mathematical integration <!-- $s = T(r) = (L-1) \int\limits_0^r p_r(w) dw$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s%20%3D%20T(r)%20%3D%20(L-1)%20%5Cint%5Climits_0%5Er%20p_r(w)%20dw"> and we use summation for discrete values in the digital world.


As an example, let's assume a _3-bit image_ <!-- $(L=8)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=(L%3D8)"> of size <!-- $64×64$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=64*64"> pixels <!-- $(MN=4096)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=(MN%3D4096)"> and the following table shows the intensity distribution and corresponding equalized values.

| <!-- $r_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_k"> 	  | <!-- $n_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=n_k">       | <!-- $p_r(r_k)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=p_r(r_k)">    |  <!-- $s_k$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_k"> 	 		|
|    :----:   |    :----:   |    :----:     |       :----:   	|
| <!-- $r_0=0$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_0%3D0">     | 790       | 0.19   	    | <!-- $s_0=1.33$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_0%3D1.33"> -> 1 |
| <!-- $r_1=1$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_1%3D1">     | 1023      | 0.25   	    | <!-- $s_1=3.08$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_1%3D3.08"> -> 3 |
| <!-- $r_2=2$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_2%3D2">     | 850       | 0.21   	    | <!-- $s_2=4.55$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_2%3D4.55"> -> 5 |		 
| <!-- $r_3=3$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_3%3D3">     | 656     	| 0.16   	    | <!-- $s_3=5.67$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_3%3D5.67"> -> 6 |
| <!-- $r_4=4$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_4%3D4">     | 329       | 0.08   	    | <!-- $s_4=6.23$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_4%3D6.23"> -> 6 |
| <!-- $r_5=5$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_5%3D5">     | 245       | 0.06   	    | <!-- $s_5=6.65$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_5%3D6.65"> -> 7 |
| <!-- $r_6=6$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_6%3D6">     | 122       | 0.03   	    | <!-- $s_6=6.86$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_6%3D6.86"> -> 7 |
| <!-- $r_7=7$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=r_7%3D7">     | 81       	| 0.02   	    | <!-- $s_7=7.00$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_7%3D7.00"> -> 7 |

## Histogram Specification (Matching)
As discussed above histogram equalization produces an output image with a uniform histogram. That's also called automatic enhancement since it's predictable and easy to implement. However, in some cases, histogram equalization is not suitable. In other words, sometimes we want to choose or specify the shape of the histogram for a specific image. This method is called _histogram matching or specification_.

Here in this type, the inputs are a specified histogram of an equalized image and an input image that we want to apply the specified histogram on it.

Let's assume that:
1. <!-- $p_r(r)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=p_r(r)"> the **PDF** for the input image we want to process and the corresponding equalized values is function of the form
<!-- $$
s_k = T(r_k) = (L-1) \displaystyle\sum_{i=1}^{k} p_r(r_i) 
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=s_k%20%3D%20T(r_k)%20%3D%20(L-1)%20%5Cdisplaystyle%5Csum_%7Bi%3D1%7D%5E%7Bk%7D%20p_r(r_i)%20"></div>

2. <!-- $p_z(z)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=p_z(z)"> is the specified **PDF** or histogram and the corresponding equalized values are a function of the form 
<!-- $$
G(z_q) = (L-1) \displaystyle\sum_{i=1}^{q} p_z(z_i)
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=G(z_q)%20%3D%20(L-1)%20%5Cdisplaystyle%5Csum_%7Bi%3D1%7D%5E%7Bq%7D%20p_z(z_i)"></div>

3. The goal is to find <!-- $z_q$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=z_q"> where <!-- $s_k = G(z_q)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=s_k%20%3D%20G(z_q)">, and we can do this by appplying the inverse transformation <!-- $z_q = G^{-1}(s_k)$ --> <img style="transform: translateY(0.1em);" src="https://render.githubusercontent.com/render/math?math=z_q%20%3D%20G%5E%7B-1%7D(s_k)">, and this is the mapping from $s$ to $z$ from the specified **PDF**.

