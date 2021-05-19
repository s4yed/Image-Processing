# Basic Intensity Transformations

In this section, I'm going to explain basic image transformations and all the math details behind each one. Each of which is going to be performed pixel-wise on an image of any dimensions. 

The processing techniques based on a transformation function <!-- $T$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=T"> and an input image <!-- $f(x,y)$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=f(x%2Cy)"> where <!-- $(x,y)$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=(x%2Cy)"> are the pixel positions in a <!-- $2D$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=2D"> image as following:

<!-- $$
g(x,y) = T[f(x,y)]
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=g(x%2Cy)%20%3D%20T%5Bf(x%2Cy)%5D%0D"></div> 
or 
<!-- $$
s = T(r)
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=s%20%3D%20T(r)%0D"></div>

For example, let's start with the **Image Negatives** and the corresponding transformation function is on the form: 

<!-- $$
s = L - 1 - r
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=s%20%3D%20L%20-%201%20-%20r%0D"></div>

where <!-- $L$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=L"> is maximum intensity values and <!-- $r \in [0, L - 1]$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=r%20%5Cin%20%5B0%2C%20L%20-%201%5D"> the pixel value that will be processed.

---

## Logarithmic Transformation

The general form of the log transformation is:

<!-- $$
s = C log(1 + r)
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=s%20%3D%20C%20log(1%20%2B%20r)%0D"></div>

where <!-- $C$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=C"> is a constant and <!-- $r \geq 0$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=r%20%5Cgeq%200">. The characteristic of the logarithmic function is it compresses the pixel with high values which is called the _**Dynamic Range**_.

## Gamma (Power-Law) Transformation

The _**Power-Law**_ transformation is on the form:

<!-- $$
s = C r^\gamma
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=s%20%3D%20C%20r%5E%5Cgamma%0D"></div>

where <!-- $C$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=C"> and <!-- $\gamma$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=%5Cgamma"> are positive constants, also the above equation can be written as <!-- $s = C (r + \epsilon)^\gamma$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=s%20%3D%20C%20(r%20%2B%20%5Cepsilon)%5E%5Cgamma"> where <!-- $\epsilon$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=%5Cepsilon"> is an offset value. The power-law characteristics map values of dark input into brighter output values and vice versa. In mathematical words, the values of <!-- $\gamma > 1$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=%5Cgamma%20%3E%201"> have the opposite effect as values generated with values of <!-- $\gamma < 1$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=%5Cgamma%20%3C%201">, and when <!-- $C = \gamma = 1$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=C%20%3D%20%5Cgamma%20%3D%201"> is called the identity transformation.

## Contrast Stretching

Images with low contrast can result from poor lighting, wrong lens setting, or even lack of dynamic range. So, the _**Contrast Stretching**_ can be used in order to expand the range of intensity levels in an image. The transformation function can be written as:

<!-- $$ 
s = 
\begin{cases}
\lfloor \frac{I_{max} - I_{min} - 2}{M - N} (r - L) \rfloor + 1 ,& \quad L \leq r \leq M 
\\ \\
I_{min} ,& \quad r < L
\\ \\
I_{max} ,& \quad r > M
\end{cases}
$$ --> 

<div align="center"><img style="" src="https://render.githubusercontent.com/render/math?math=s%20%3D%20%0D%0A%5Cbegin%7Bcases%7D%0D%0A%5Clfloor%20%5Cfrac%7BI_%7Bmax%7D%20-%20I_%7Bmin%7D%20-%202%7D%7BM%20-%20N%7D%20(r%20-%20L)%20%5Crfloor%20%2B%201%20%2C%26%20%5Cquad%20L%20%5Cleq%20r%20%5Cleq%20M%20%0D%0A%5C%5C%20%5C%5C%0D%0AI_%7Bmin%7D%20%2C%26%20%5Cquad%20r%20%3C%20L%0D%0A%5C%5C%20%5C%5C%0D%0AI_%7Bmax%7D%20%2C%26%20%5Cquad%20r%20%3E%20M%0D%0A%5Cend%7Bcases%7D%0D"></div>

where <!-- $L_{min}$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=L_%7Bmin%7D"> and <!-- $L_{max}$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=L_%7Bmax%7D"> are the minimum and maximum intensity values in a grayscale image, and <!-- $L$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=L"> and <!-- $M$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=M"> are the values of the minimum and maximum of the gray level range to be stretched.

## Thresholding

The _**Thresholding**_ technique is a special case of _Contrast Stretching_ only when <!-- $M = N = k,$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=M%20%3D%20N%20%3D%20k%2C"> <!-- $I_{max} = L-1,$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=I_%7Bmax%7D%20%3D%20L-1%2C"> and <!-- $I_{min} = 0$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=I_%7Bmin%7D%20%3D%200"> and <!-- $k$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=k"> is the mean intensity level in the image.

## Bit-Plane (Level) Sclicing

In this technique, each pixel represented as an _8-bit_ integer value in _256-level_ grayscale images also called _ one-byte_ and the goal here is to extract each _bit_ value and reconstruct it into a new binary image with a pixel of only <!-- $zeros$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=zeros"> and <!-- $ones$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=ones">.

For example, <!-- $10110110$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=10110110"> the least significant bit <!-- $0$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=0"> represents _Bit Plane 1_, and the most significant bit <!-- $1$ --> <img style="transform: translateY(0.1em); " src="https://render.githubusercontent.com/render/math?math=1"> represents _Bit Plane 8_.
