module Cucumber
  module SmartAst
    class Executor
      def initialize(step_mother)
        @step_mother = step_mother
      end

      def execute(ast)
        background = ast.bg
        ast.scenarios.each do |scenario|
          if background
            background.steps.each { |step| invoke(step) }
          end
          scenario.steps.each { |step| invoke(step) }
        end
      end

      def invoke(step)
        @step_mother.invoke(step.name)
      end
    end
  end
end
