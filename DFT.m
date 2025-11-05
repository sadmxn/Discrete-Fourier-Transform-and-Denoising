function DFT(threshold)
  
    % Resetting the random number generator

    rng('default');

    % Creating the clean signal

    t = (0:255) / 256;
    f1 = 1; f2 = 10; f3 = 20;
    x0 = 3*sin(2*pi*f1*t) + cos(2*pi*f2*t) + 2*sin(2*pi*f3*t);
    
    % Creating Gaussian noise and adding it to the clean signal

    noise = randn(1, 256);
    x = x0 + noise;
    
    % Creating the first figure with three tiles for the signals

    figure;
    fig1 = tiledlayout(3, 1);
    
    % Plotting the clean signal

    nexttile;
    plot(t, x0,'r');
    title('Clean Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');
    
    % Plotting the noisy signal

    nexttile;
    plot(t, x,'b');
    title('Noisy Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');
    
    % Computing the 256-point DFT of the noisy signal using fft( )

    y = fft(x);
    
    % Creating the second figure

    figure;
    fig2 = tiledlayout(2, 1);
    
    % Defining the x-axis for the DFT vector plot as t since it is the same
    
    % Plot the DFT magnitude of the noisy signal
    nexttile;
    plot(t, abs(y),'g');
    title('DFT Magnitude of Noisy Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');
    
    % Denoising the DFT output:
    % Set 0 when magnitude is less than the threshold

    y_denoised = y;
    y_denoised(abs(y) < threshold) = 0;
    
    % Plot the denoised DFT magnitude

    nexttile;
    plot(t, abs(y_denoised),'m');
    title(['DFT Magnitude after Denoising (Threshold = ', num2str(threshold), ')']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    
    % Reconstructing the signal using the inverse DFT

    xrec = ifft(y_denoised);
    
    % Calculating the Mean Squared Error (MSE) between the clean and reconstructed signals

    mse = mean((x0 - xrec).^2);
    disp(['Mean Squared Error (MSE): ', num2str(mse)]);
    
    % Return to the first figure and plot the reconstructed signal in the third tile

    nexttile(fig1, 3);
    plot(t, xrec,'c');
    title('Reconstructed Signal x_{rec}');
    xlabel('Time (s)');
    ylabel('Amplitude');
end