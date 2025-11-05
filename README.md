# Discrete-Fourier-Transform-and-Denoising
Matlab function to study DFT and DFT domain denoising.

Explore the use of the Discrete Fourier Transform (DFT) for denoising a noisy signal and in order to do that we:
- Generated a clean signal composed of three sinusoidal components at 1 Hz, 10 Hz, and 20 Hz.

- Added Gaussian noise to simulate a realistic noisy environment.

- Computed the 256-point DFT of the noisy signal.

- Applied thresholding in the DFT domain to remove noise by zeroing coefficients below a specified threshold.

- Reconstructed the signal using the inverse DFT.

- Evaluated the denoising performance via the Mean Squared Error (MSE) between the reconstructed and clean signals.
