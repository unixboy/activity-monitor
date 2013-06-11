# Activity Monitor

Simple activity monitor for HTTP resources.


# Usage

Execute 

	git clone https://github.com/cmichi/activity-monitor.git
	cd activity-monitor
	mkdir tmp

Add to your cronjob file:

	*/15 * * * * (cd /path/to/activity-monitor/ && /bin/sh ./15-min.sh)
	0 */12 * * * (cd /path/to/activity-monitor/ && /bin/sh ./12-hrs.sh)
	0 */4 * * * (cd /path/to/activity-monitor/ && /bin/sh ./4-hrs.sh)

You can then go on to add resources you want to monitor to the files
`15-min.sh`, `12-hrs.sh`, `4-hrs.sh`:
	
	./check-for-changes.sh \
		"alice@mail.de" \
		"http://some-resource.net/index.html" \

Or with preprocessing of content:

	./check-for-changes.sh \
		"alice@mail.de" \
		"http://some-resource.net/index.html" \
		"preprocess/only-body.sh"


# License

	Copyright (c) 2013

		Michael Mueller <http://micha.elmueller.net/>

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


