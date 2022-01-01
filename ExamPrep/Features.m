%% Features, Descriptors and Object Representation.
% 
clear;

%% What are descriptors?
% In general, descriptors are a set of numbers that are produced to
% describe a given shape. The shape might not be entirely reconstructable
% from the descriptors but the descriptors should be seperable.

%% Shape Descriptors.
% 1. Area
% 2. Perimeter
% 3. Compactness or circularity: How closely-packed the shape is. If it is
% a circle the area is 4*pi. Otherwise it is larger. 
% 4. Eccentricity: The ratio of the length of the longest cord to the one
% that is perpendicular.
% 5. Elongation: The ratio of the height and width of a rotated minimal
% bounding box. 
% 6. Rectangularity: Area of object / area of bounding box
% 7. Orientation: Overall direction of shape.

%% Topological Descriptors.
% These are descriptors that does not change by changing the surface. The
% only limitation is that you are not allowed to tear or join parts.

%% Euler Number
% The Euler Number is the number of connected components C and the number
% of holes H. and is calculated as E = C - H. 

%% Convex Hull: Bays
% Although not strictly a topological property, we can also describe shape 
% properties by measuring the number or size of concavities in the shape.

