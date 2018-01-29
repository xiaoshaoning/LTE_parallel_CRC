function crc = parallel_crc_compute_128_bits(input, crc_type)
% crc = parallel_crc_compute_128_bits(input, crc_type)
% @input parameter: input: 0-1 bits
%                   crc_type: '6', '8', '11', '16', '24A', '24B', '24C'
% @output parameter: crc
% The algorithm is according to "High-Speed Parallel CRC Circuits in VLSI" 
% by Tong-Bi Pei and Charles Zukowski.
% @author: Xiao, Shaoning
% @email: xiaoshaoning@foxmail.com

k = 128;

if mod(length(input), k) ~= 0
    d = [zeros(1, k - mod(length(input), k)), input];
else
    d = input;
end

if strcmpi(crc_type, '6')
    crc_poly = [1, 1, 0, 0, 0, 0, 1];
elseif strcmpi(crc_type, '8')
    crc_poly = [1, 1, 0, 0, 1, 1, 0, 1, 1];
elseif strcmpi(crc_type,'11')
    crc_poly = [1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1];
elseif strcmpi(crc_type,'16')
    crc_poly = [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
elseif strcmpi(crc_type,'24A')
    crc_poly = [1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1];
elseif strcmpi(crc_type, '24B')
    crc_poly = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1];
elseif strcmpi(crc_type, '24C')
    crc_poly = [1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1];
else
    error('ERROR: Invalid crc_type');    
end

n = length(crc_poly) - 1;

G_prime = crc_poly(2:end);

G = G_prime(end:-1:1);

T = zeros(n, n);
for index = 1:(n-1)
    T(index, index+1) = 1;
end
T(n, :) = G;

D = zeros(k, n);

D(1, :) = G;
for index = 1:(k-1)
    D(index+1, :) = mod(D(index, :) * T, 2);
end

x = zeros(1, n);

for t = 1:length(d)/k
    x_2 = [zeros(1, k-n), x];
    x = mod((x_2 + d(t*k:-1:(t-1)*k+1)) * D, 2);
end

crc = x(end:-1:1);

end