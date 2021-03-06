# Cordova iOS Game Center Plugin #

## DESCRIPTION ##

* A plugin to integrate Game Center in a Phonegap iOS app/game.
* Please read [Game Center Programming Guide](http://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/GameKit_Guide/GameCenterOverview/GameCenterOverview.html) and the [iTunes Connect Developer Guide](https://itunesconnect.apple.com/docs/iTunesConnect_DeveloperGuide.pdf).

## SETUP ##

Using this plugin requires [Cordova iOS](https://github.com/apache/incubator-cordova-ios).

0. git clone this to `GameCenter`
1. Make sure your Xcode project has been [updated for Cordova](https://github.com/apache/incubator-cordova-ios/blob/master/guides/Cordova%20Upgrade%20Guide.md)
2. Drag and drop the `GameCenter` folder from Finder to your Plugins folder in XCode, using "Create groups for any added folders"
3. Add the .js files to your `www` folder on disk, and add reference(s) to the .js files using <script> tags in your html file(s)

    <script type="text/javascript" src="/js/plugins/GameCenterPlugin.js"></script>

4. Add new entry with key `GameCenterPlugin` and value `GameCenterPlugin` to `Plugins` in `Cordova.plist/Cordova.plist`
5. Add new entry value `service.gc.apple.com` and `service-sandbox.gc.apple.com` to `ExternalHosts` in `Cordova.plist/Cordova.plist`

## JAVASCRIPT INTERFACE ##

    // After device ready, create a local alias
    var gamecenter = window.plugins.gamcenter

    // Use Leaderboard ID added to iTunes Connect.
    var LEADERBOARD_ID = "1"

    // Report integer score to Leaderboard
    var score = 100
    gamecenter.reportScore(LEADERBOARD_ID, score);

    // Show leaderboard by modal view
    gamecenter.showLeaderboard(LEADERBOARD_ID);

    // Unlock achivement
    var ACHIEVEMENT_ID = 'star'
    gamecenter.getAchievement(ACHIEVEMENT_ID);

    // Show achievements by modal view
    gamecenter.showAchievements();

## Licence ##

The MIT License

Copyright (c) 2011 Marco Piccardo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
