class: CommandLineTool
cwlVersion: v1.3.0-dev1
requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.file1)
        entryname: bob.txt
inputs:
  file1: 
    type: File
    inputBinding:
      position: 1
outputs: 
  output: stdout
baseCommand: ["cat"]
