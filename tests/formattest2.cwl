$namespaces:
  edam: http://edamontology.org/
$schemas:
  - EDAM.owl
class: CommandLineTool
cwlVersion: v1.3.0-dev1
doc: "Reverse each line using the `rev` command"
hints:
  DockerRequirement:
    dockerPull: docker.io/debian:stable-slim

inputs:
  input:
    type: File
    inputBinding: {}
    format: edam:format_2330

outputs:
  output:
    type: File
    outputBinding:
      glob: output.txt
    format: $(inputs.input.format)

baseCommand: rev
stdout: output.txt
