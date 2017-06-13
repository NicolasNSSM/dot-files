# vim: ft=ruby

guard :shell do
  watch /^(src|spec|features|tests)/ do
    `ctags -f sources.tags src spec features tests`
  end

  watch /^composer/ do
    `ctags -f vendors.tags vendor`
  end
end
