---
title: 'RSpec basics'
---
```ruby
# describe, context, it — scope gates. accept a parameter for documentation output
# describe — one for class
# context — one for test suite (avoid, it usually means you violate SRP)
# it — one for test case

describe ColorizedString do
  it "knows which colors are implemented" do
    # expect — evaluates input
    # to — accepts a matcher

    # value.should eq 0
    # expect(value).to eq 0

    expect { ColorizedString.new("a", :grey) }.to raise_error(NotImplementedError)
  end

  it "can paint a string green" do
    str = "this is green"

    expect(ColorizedString.new(str, :green)).to eq("\e[32m#{str}\e[0m")
  end

  it "should do something new" do
     pending "working"
  end
end
```
