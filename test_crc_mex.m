% test file to show how to use parallel_crc_calculation mex function
% crc = parallel_crc_calculation(input_bits, input_bits_length, crc_type);
% crc_type: 0, 1, 2, 3
% a table based crc calculation according to 'A PAINLESS GUIDE TO CRC ERROR DETECTION ALGORITHMS INDEX V3.00 (9/24/96)'
% url: http://www.repairfaq.org/filipg/LINK/F_crc_v3.html
% author: Xiao, Shaoning
% email: xiaoshaoning@foxmail.com
% date: 2017/7/15
% 
function test_crc_mex

pass_flag = 1;

passed_number = 0;

for crc_type = 0:3
    
    switch crc_type
        case 0
            crc_type_prime = '8';
        case 1
            crc_type_prime = '16';
        case 2
            crc_type_prime = '24A';
        case 3
            crc_type_prime = '24B';
    end
    
    for input_bits_length = 16:8:6144
        
        input_bits = randi([0, 1], 1, input_bits_length);
        
        crc = parallel_crc_calculate(input_bits, crc_type_prime);
        
        crc_prime = lte_calc_crc(input_bits, crc_type_prime);
        
        if ~isequal(crc, crc_prime)
            pass_flag = 0;
            break;
        else
            passed_number = passed_number + 1;
            fprintf('.');
            
            if mod(passed_number, 100) == 0
                fprintf('\n');
            end
        end
        
    end
end

fprintf('\n');

if pass_flag == 1
    disp('crc test passed.');
else
    disp('crc test failed.');
end

end
