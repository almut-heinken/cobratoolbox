% The COBRAToolbox: calculateFluxShifts.m
%
% Purpose:
%     - For testing the IgemRNA post-optimization task called "Calculate flux
%     shifts between phenotypes" which calculates flux differences for each
%     reaction from two (or more if target = "All") result model files generated by createContextSpecificModel.m. 
%
% Authors:
%     - Kristina Grausa 05/16/2022 - created 
%     - Kristina Grausa 08/22/2022 - standard header and formatting
%

global CBTDIR

% define the required solvers
requiredSolvers = {'needsLP', 'matlab'};

% check if the specified requirements are fullfilled
solvers = prepareTest('needsLP',true);

% save the current path and initialize the test
currentDir = cd(fileparts(which(mfilename)));

% determine the test path for references
testPath = pwd;

% set the tolerance
tol = 1e-8;

% set function params
source = {'SRR8994357_WT';};
target = {'SRR8994378_S47D';};

for k = 1:length(solvers.LP)
    solverLPOK = changeCobraSolver(solvers.LP{k}, 'LP', 0);

    if solverLPOK
       calculateFluxShifts(source, target);
       
       fprintf(' -- Running testFluxShifts.m using the solver interface: %s ... ', solvers.LP{k});
       
       assert(numel(dir('resultsPostOptimization\fluxShifts\')) > 2)
       
       % output a success message
       fprintf('Done.\n');
    end
end

% change the directory
cd(currentDir)