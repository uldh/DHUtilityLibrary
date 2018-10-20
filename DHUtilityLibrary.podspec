
Pod::Spec.new do |s|
    s.name         = 'DHUtilityLibrary'
    s.version      = '0.0.1'
    s.summary      = 'utility library for ios develope'
    s.homepage     = 'https://github.com/uldh/DHUtilityLibrary'
    s.license      = 'MIT'
    s.authors      = {'Liu Donghao' => 'uldh@163.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/uldh/DHUtilityLibrary.git', :tag => s.version}
    s.source_files = 'DHUtilityLibrary/DHUtilityLibrary/*.{h,m}'
    s.requires_arc = true
    s.dependency   = 'Masonry'
end
