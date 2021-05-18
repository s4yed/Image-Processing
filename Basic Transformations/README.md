# Basic Intensity Transformations
In this section, I'm going to explain basic image transformations and all the math details behind each one. Each of which is going to be performed pixel-wise on an image of any dimensions. 

The processing techniques based on a transformation function $T$ and an input image $f(x,y)$ where $(x, y)$ are the pixel positions in a $2D$ image as following:

$$g(x,y) = T[f(x,y)]$$ 
or 
$$s = T(r)$$

For example, let's start with the **Image Negatives** and the corresponding transformation function is on the form: 

$$s = L - 1 - r$$

where $L$ is maximum intensity values and $r \in [0, L - 1]$ the pixel value that will be processed.

---

### Logarithmic Transformation
The general form of the log transformation is:

$$s = C log(1 + r)$$

where $C$ is a constant and $r \geq 0$. The characteristic of the logarithmic function is it compresses the pixel with high values which is called the _**Dynamic Range**_.

### Gamma (Power-Law) Transformation
The _**Power-Law**_ transformation is on the form:

$$s = C r^\gamma$$

where $C$ and $\gamma$ are positive constants, also the above equation can be written as $s = C (r + \epsilon)^\gamma$ where $\epsilon$ is an offset value. The power-law characteristics map values of dark input into brighter output values and vice versa. In mathematical words, the values of $\gamma > 1$ have the opposite effect as values generated with values of $\gamma < 1$, and when $C = \gamma = 1$ is called the identity transformation.

### Contrast Stretching
Images with low contrast can result from poor lighting, wrong lens setting, or even lack of dynamic range. So, the _**Contrast Stretching**_ can be used in order to expand the range of intensity levels in an image. The transformation function can be written as:

$$ 
s = 
\begin{cases}
\lfloor \frac{I_{max} - I_{min} - 2}{M - N} (r - L) \rfloor + 1 ,& \quad L \leq r \leq M 
\\ \\
I_{min} ,& \quad r < L
\\ \\
I_{max} ,& \quad r > M
\end{cases}
$$

where $L_{min}$ and $L_{max}$ are the minimum and maximum intensity values in a grayscale image, and $L$ and $M$ are the values of the minimum and maximum of the gray level range to be stretched.

### Thresholding
The _**Thresholding**_ technique is a special case of _Contrast Stretching_ only when $M = N = k,$ $I_{max} = L-1,$ and $I_{min} = 0$ and $k$ is the mean intensity level in the image.

### Bit-Plane (Level) Sclicing
In this technique, each pixel represented as an _8-bit_ integer value in _256-level_ grayscale images also called _ one-byte_ and the goal here is to extract each _bit_ value and reconstruct it into a new binary image with a pixel of only $zeros$ and $ones$.

For example, $10110110$ the least significant bit $0$ represents _Bit Plane 1_, and the most significant bit $1$ represents _Bit Plane 8_.
