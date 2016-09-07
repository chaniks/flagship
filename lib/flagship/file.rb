
module Flagship
  module FileUtils
    def in_files?(enum)
      enum.any? { |e| File.absolute_path(e) == File.absolute_path(self) }
    end
  end
end
