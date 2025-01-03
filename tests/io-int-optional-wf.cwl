#!/usr/bin/env cwl-runner
class: Workflow
cwlVersion: v1.3.0-dev1

requirements:
  - class: InlineJavascriptRequirement

inputs:
  i:
    type: int?
  i1: 
    type: int[]?
  i2:
    type: 
      - "null"
      - type: record
        fields:
          a:
            type: int
          b: 
            type: float

outputs:
  o:
    type: int
    outputSource: step1/o

steps:
  step1:
    in:
      i: i
      i1: i1
      i2: i2
    out: [o]
    run:
      class: ExpressionTool
      inputs:
        i:
          type: int?
        i1: 
          type: int[]?
        i2:
          type: 
            - "null"
            - type: record
              fields:
                a:
                  type: int
                b: 
                  type: float
      outputs:
        o:
          type: int
      expression: >
        ${return {'o': (inputs.i || 2) * ((inputs.i1 != null && inputs.i1.length > 1) ? inputs.i1[0] : 2) * ((inputs.i2 != null) ? inputs.i2.a : 2) * 2};}
