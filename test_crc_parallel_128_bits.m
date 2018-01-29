% test file to show how to use parallel_crc_compute_128_bits
% author: Xiao, Shaoning
% email: xiaoshaoning@foxmail.com
 
function test_crc_parallel_128_bits

pass_flag = 1;

passed_number = 0;

for crc_type = 0:6
    
    switch crc_type
        case 0
            crc_type_prime = '6';
        case 1
            crc_type_prime = '8';
        case 2
            crc_type_prime = '11';
        case 3
            crc_type_prime = '16';
        case 4
            crc_type_prime = '24A';
        case 5
            crc_type_prime = '24B';
        case 6
            crc_type_prime = '24C';
    end
    
    for input_bits_length = 8400:1:8424
        
        input_bits = randi([0, 1], 1, input_bits_length);
        
        crc = parallel_crc_compute_128_bits(input_bits, crc_type_prime);
        
        crc_prime = crc_for_5g(input_bits, crc_type_prime);
        
        if ~isequal(crc, crc_prime)
            pass_flag = 0;
%             break;
        else
            passed_number = passed_number + 1;
            fprintf('.');
            
            if mod(passed_number, 100) == 0
                fprintf('\n');
            end
        end
        
    end
    disp(passed_number);
end

fprintf('\n');

if pass_flag == 1
    disp('crc test passed.');
else
    disp('crc test failed.');
end

end