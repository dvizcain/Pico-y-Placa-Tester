% Code programmed to run in Matlab.
% 
% Validation of input data only performed on licence plate:
% Checks for length of Plate between 7 and 8 elements.
% Checks if first 3 elements are letters.
% Checks 4th element to be '-'.
% Checks last 3 or 4 elements to be numbers.
% If any of this conditions are met, display error accordingly.
% Otherwise continue.
% 
% Additional verification should be programmed for verification of Date,
% and Time
% 
% First create an object of class Placa, example:
% a = Placa('ABC-6623')
% 
% Then specify date and Time
% a.Date='24-Sept-2018';
% a.Time='00:53:00';
% 
% Result:
% 
% a = 
% 
%   Placa with properties:
% 
%     Plate: 'ABC-6623'
%      Date: '24-Sept-2018'
%      Time: '00:53:00'
% 
% Run tests:
% 
% check_plate(a)
% -------------------------
% Car with Plate: ABC-6623
% Allowed to road
% Today is is: 24-Sept-2018 00:53:00
% -------------------------


% Change a.Plate for 'ABC-6624' and set Date and Time as before
% a = Placa('ABC-6624');
% a.Date='24-Sept-2018';
% a.Time='00:53:00';
% 
% a = 
% 
%   Placa with properties:
% 
%     Plate: 'ABC-6624'
%      Date: '24-Sept-2018'
%      Time: '00:53:00'
% 
% Result:
% 
% check_plate(a)
% -------------------------
% Car with Plate: ABC-6624
% Not allowed to road
% Today is is: 24-Sept-2018 00:53:00
% -------------------------
% 

classdef Placa < handle
    properties
        Plate
        Date
        Time
    end
    methods
        function obj = Placa(val)
            if nargin == 1
                
                %Check if length is greater than 7 but smaller than 8
                if length(val) < 7 || length(val) > 8
                    error('Licence plate must contain 7 or 8 elements')
                    
                    %Check if first 3 elements are letters:
                    %isletter returns logical one (true), if a letter is found
                    %nnz counts number of nonzero elements, if number of nonzero elements
                    %is 3, it means 3 first elements are letters
                elseif nnz(isletter(val(1:3))) ~= 3
                    error('Licence plate must contain 3 letters at the start')
                    
                    %Check if 4th element is not a '-' character
                elseif ~strcmp(val(4),'-')
                    error('4th element must be "-"')
                    
                    %Check if last 3 elements are not letters but numbers
                elseif nnz(isletter(val(5:7))) >= 1
                    error('Last 3 elements must be numbers')
                    
                    %Check if last 4 elements are not letters but numbers
                elseif length(val) == 8
                    if nnz(isletter(val(5:8))) >= 1
                        error('Last 4 elements must be numbers')
                    else
                        obj.Plate = val;
                    end
                    
                    %Otherwise continue
                else
                    obj.Plate = val;
                    
                end
            end
        end
        
        function check_plate(obj)
            if obj.Plate(end) == obj.Date(2)
                disp('-------------------------')
                disp(['Car with Plate: ',num2str(obj.Plate)])
                disp('Not allowed to road')
                disp(['Today is is: ',num2str(obj.Date),' ',num2str(obj.Time)])
                disp('-------------------------')
                return
            else
                disp('-------------------------')
                disp(['Car with Plate: ',num2str(obj.Plate)])
                disp('Allowed to road')
                disp(['Today is is: ',num2str(obj.Date),' ',num2str(obj.Time)])
                disp('-------------------------')
            end
        end
    end
end







%