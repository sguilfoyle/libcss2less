require 'spec_helper'
require 'css2less'

describe Css2Less do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end

describe Css2Less::Converter do
  it "should convert basic css structure into less structure" do
    css = <<EOF
#hello {
    color: blue;
}

#hello #buddy {
    background: red;
}
EOF
    less = <<EOF
#hello {
    color: blue;
    #buddy {
        background: red;
    }
}
EOF
    converter = Css2Less::Converter.new(css)
    converter.process_less
    converter.get_less.should eq(less)
  end

end