# BlogDemo

### Xcode

- Version 7.2 (7C68)

### Libraries from CocoaPods

- `Alamofire`: networking.
- `OHHTTPStubs`: stubbing network responses.
- `ObjectMapper`: mapping response JSON to objects.
- `SDWebImage`: image downloading and caching.

### Notes

- For creating `UITableViewCell`'s used XIB for better reuseability.
- Stubbed response is created as `plist` file and then converted to JSON. Both files referenced in project.
- For better project structuring used `Synx` tool, which creates folders in file system corresponding to project groups.
