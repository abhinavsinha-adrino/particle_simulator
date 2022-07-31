classdef particle
    %PARTICLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        velocity
        start_velocity
        start_position
        position
        charge
        mass
        step
        %v_half 
    end
    
    methods
        function obj = particle(position, velocity, charge, mass, step)
            %PARTICLE Construct an instance of this class
            %   Detailed explanation goes here
            obj.start_velocity = velocity;
            obj.start_position = position;
            obj.position = position;
            obj.velocity = velocity;
            obj.charge = charge;
            obj.mass = mass;
            obj.step = step;
            %obj.v_half = obj.velocity + obj.step / 2 * obj.charge * (cross())
        end
        
        function object = borispush(obj,E, B)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            %outputArg = obj.Property1 + inputArg;
            %B1 = B(obj.position, t);
            %E1 = E(obj.position, t);
            %v_temp = copy(obj.velocity);
            q_dash = obj.step * obj.charge /obj.mass/2;
            H = q_dash * B;
            s = 2* H/ (1+norm(H)^2);
            v_minus = obj.velocity + q_dash* E;
            v_prime = v_minus + cross(v_minus, H);
            v_plus = v_minus + cross(v_prime, s);
            obj.velocity = v_plus + q_dash*E;
            obj.position = obj.position + obj.velocity*obj.step;
            object = obj;
        end
        
        function object = reset(obj)
            obj.velocity = obj.start_velocity;
            obj.position = obj.start_position;
            object = obj;
        end
        
    end
end

