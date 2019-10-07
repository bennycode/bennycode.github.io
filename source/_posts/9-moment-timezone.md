---
title: Get milliseconds of date in specific timezone
date: 2019/7/03 15:12:18
categories:
  - [JavaScript]
tags:
  - CEST
  - GMT
  - IANA
  - moment
  - timezone
  - UTC
---

[Moment.js](https://momentjs.com/) is a great choice if you want to work with dates and times in JavaScript. It is very handy for creating interchange representations like [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) strings, taking your current timezone into account.

## Convert to milliseconds

Let's say you live in Berlin (Germany) and you want to represent June, 26th of 2019 at midnight in milliseconds with Central European Summer Time (GMT+2). With [Moment.js](https://momentjs.com/) v2.24 you have at least the following possibilities to do that:

**Defined UTC Offset**

{% codeblock lang:js defined-utc-offset.js %}
const moment = require('moment');
const unixTimestamp = moment('2019-06-26T00:00:00.000+02:00').valueOf();
console.log('unixTimestamp', unixTimestamp); // 1561500000000
{% endcodeblock %}

**Detected UTC Offset**

{% codeblock lang:js detected-utc-offset.js %}
const moment = require('moment');
const utcOffsetInMinutes = new Date().getTimezoneOffset(); // -120 (2 hours)
const utcOffsetInMillis = utcOffsetInMinutes * 60000;
const unixTimestamp = moment('2019-06-26T00:00:00.000Z').valueOf() + utcOffsetInMillis;
console.log('unixTimestamp', unixTimestamp); // 1561500000000
{% endcodeblock %}

**Defined Zone Info**

{% codeblock lang:js defined-zone-info.js %}
const moment = require('moment-timezone');
const zoneInfo = 'Europe/Berlin';
const unixTimestamp = moment.tz('2019-06-26 00:00:00', zoneInfo).valueOf();
console.log('unixTimestamp', unixTimestamp); // 1561500000000
{% endcodeblock %}

**Detected Zone Info**

{% codeblock lang:js detected-zone-info.js %}
const moment = require('moment-timezone');
const zoneInfo = moment.tz.guess();
const unixTimestamp = moment.tz('2019-06-26 00:00:00', zoneInfo).valueOf();
console.log('unixTimestamp', unixTimestamp); // 1561500000000
{% endcodeblock %}

**Pro Tip:** You can get date and time expressed according to ISO 8601 in JavaScript from the current date when calling: 

```js
new Date().toISOString(); // "2019-07-03T13:12:18.784Z"
```

Note that the above string will always be normalized to UTC time (Z). To prevent UTC conversion you may call:

```js
new Date().toISOString(true); // "2019-07-03T15:12:18.784+02:00"
```