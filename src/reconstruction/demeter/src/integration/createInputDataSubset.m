function createInputDataSubset(tmpModels,inputDataFolder)

microbeIDs = {};
for i=1:length(tmpModels)
    microbeIDs{i,1}=adaptDraftModelID(tmpModels{i});
end

inputFiles = {
    'CarbonSourcesTable'
    'FermentationTable'
    'GrowthRequirementsTable'
    'secretionProductTable'
    'uptakeTable'
    };

for i=1:length(inputFiles)
    data = readInputTableForPipeline([inputDataFolder filesep inputFiles{i} '.txt']);
    [C,I] = setdiff(data(:,1),microbeIDs,'stable');
    data(I(2:end),:) =  [];
    writetable(cell2table(data),[inputDataFolder filesep inputFiles{i} '_tmp.txt'],'FileType','text','WriteVariableNames',false,'Delimiter','tab')
end

end
