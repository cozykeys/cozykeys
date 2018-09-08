---
title: "First Handwired Speedo"
date: 2018-09-04T07:06:39-07:00
draft: true
navActive: "builds"
tags: ["speedo"]
breadcrumb:
- name: "Home"
  path: "/"
- name: "Builds"
  path: "/builds/"
---

# First Handwired Speedo

This build log documents the process I went through in creating the first,
functional Speedo keyboard. It is rather long so a table of contents is
provided to make finding a specific step a bit easier.

## Table of Contents

* [2018/02/16](#2018-02-16)
  * Creating the Thumb Clusters
* [2018/02/23](#2018-02-23)
  * Rev1 Comes to an End
  * Oops
  * Solution
  * Next Steps
* [2018/02/25](#2018-02-25)
  * Order is in for Rev2
* [2018/02/26](#2018-02-26)
  * Deciding on Parts
    * The Decision
    * A Close Second
* [2018/03/07](#2018-03-07)
  * The parts arrived!
* [2018/03/10](#2018-03-10)
  * Starting the Build
    * Inserting the Switches
    * Gluing the Switches in Place
    * Soldering the Diodes
* [2018/03/11](#2018-03-11)
  * Rows and Columns
    * Rows 
    * Columns
* [2018/03/13](#2018-03-13)
  * Rows and Columns (Cont.)
    * More Columns 
* [2018/03/14](#2018-03-14)
  * Rows and Columns (Cont. x 2)
    * Finishing the Columns 
* [2018/03/28](#2018-03-28)
  * Destroying a Teensy 3.2
    * The First Few Columns
    * The Accident
* [2018/04/02](#2018-04-02)
  * Getting the Controller Ready
    * Attaching the Wires
    * Placing the Controller
* [2018/04/03](#2018-04-03)
  * Finishing Up the Soldering
    * Connecting the Rows
    * Connecting the Columns
    * Keycaps and Firmware

<a name="2018-02-16" aria-hidden="true"></a>
# 02/16/2018

## Creating the Thumb Clusters
I started off by copying a single switch cutout and rotating it back 10 degrees
so it would be horizontal:

{{<
    image_link
        imageText="Switch Cutout"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_180404.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_180404.png"
>}}

I wanted to visualize what the keycaps would look like to get a better idea of
how to position the keys. PimpMyKeyboard provides PDF spec sheets for their
keycaps so I got the dimensions for a DCS 1u keycap from that and rounded to
18.1mm:

{{<
    image_link
        imageText="Keycap Dimensions"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_130655.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_130655.png"
>}}

Using those dimensions, I added the keycap overlay:

{{<
    image_link
        imageText="Keycap Overlay"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_180910.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_180910.png"
>}}

I figured the best way to get a nice arc shape for the thumb keys was to lay them out on a circle. I had to brush up on some trigonometry to remember how to get the coordinates of points on a circle:

{{<
    image_link
        imageText="Points On A Circle"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_212426.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_212426.png"
>}}

One slight annoyance in Inkscape (Or SVG files in general?) is that the X,Y coordinates of an object are not based on the object's center but on the bottom left most point:

{{<
    image_link
        imageText="Coordinate Adjustments"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_212913.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_212913.png"
>}}

Also, when an object is rotated, height and width changes as well:

{{<
    image_link
        imageText="Diameter Adjustments"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_213316.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_213316.png"
>}}

These aren't a big deal we can easily get the adjusted values with a few simple equations:

{{<
    image_link
        imageText="Adjustment Equations"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_213556.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_213556.png"
>}}

The last step was finding a suitable value for *r*. I could have done some more math and come up with a radius based on the distance between the closest corners of each keycap; however, that seemed like more work than doing a little bit of trial and error.

So, I started with a radius of 50mm. That was too small so I bumped it up to 100mm, which was too big. From there I basically just did a manual binary search until I came to the value of 82 which seemed to suffice.

I decided to start at an angle of 10 degrees -- which is the angle the keys are already at on the Atreus62 -- and bump it up by 15 degrees for each additional key.

The final product:

{{<
    image_link
        imageText="Final Switch Generation"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_214239.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_214239.png"
>}}

After that I just had to paste the thumb clust back on the original board. I lined up the first key using the same spacing that the existing keys on the board used and then redesigned the bottom of the case to accomodate the additional real estate.

I ordered the first revision from Ponoko so I will see if it is comfortable and if I think anything should be changed.

The first revision:

{{<
    image_link
        imageText="Revision 1"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/rev1_speedo_plates.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/rev1_speedo_plates.png"
>}}


[keycap overlay]: http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180216_180910.png "Keycap Overlay"

<a name="2018-02-23" aria-hidden="true"></a>
# 02/23/2018

## Rev1 Comes to an End

Yesterday the first iteration of the case files came from Ponoko. I'm glad I
chose Ponoko because it was the cheapest option and I made a couple of
mistakes.

They were out of the material that I ordered which was a light blue matte
acrylic so they used the clear blue gloss acrylic instead. Some pictures of the
plates:

{{<
    image_link
        imageText="Photo 1"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_20-41-48_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_20-41-48_00_1600x1200.jpg"
>}}

{{<
    image_link
        imageText="Photo 2"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_20-41-59_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_20-41-59_00_1600x1200.jpg"
>}}

{{<
    image_link
        imageText="Photo 3"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_20-42-02_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_20-42-02_00_1600x1200.jpg"
>}}

## Oops

The critical mistake that I made is the the second innermost thumb key is too
close to the key just above it. I thought I left enough space for the keycaps
to fit but I guess not.

It's more obvious in this picture I took in front of my monitor:

{{<
    image_link
        imageText="Photo 4"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_23-37-54_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/02-22_23-37-54_00_1600x1200.jpg"
>}}

## Solution

Anyways, after a bit of comparing the Atreus62 keys to the Speedo, I've decided
to put the two innermost thumb keys back to their original location. Pulling
the innermost key further down is actually less comfortable and the angle on
the second innermost thumb key is unnecessary.

That said, the two outer thumb keys are incredibly comfortable so I will be
leaving those exactly as is. That's actually a bit of a relief because the
perimeter of the case doesn't have to change now.

## Next Steps

So, the next step will be moving those two thumb keys back and then designing
the middle layers. I'm thinking I might make two different middle layers:
* A "top" middle layer with an area for the controller to sit
* A "bottom" middle layer that only runs the perimeter of the case

Since I don't have a PCB, the controller is just going to be hot glued to the
case. Adding a plastic area for it to fit snuggly in should help avoid any
issues when plugging/unplugging the USB cable. The downside is that a
translucent switch plate is out of the question because the hot glue will be
ugly to look at.

The alternative is to use a breakout board, something like this:

https://www.tindie.com/products/loglow/teensy-32-breakout-revision-d/

Unfortunately that is big and a goal for this board is to keep it as low
profile as possible.

I'm hoping to get rev2 done tomorrow and ordered by Monday! I currently have a
Kailh low profile switch tester and 70 low profile keycaps in the mail. I'm
hoping to decide which switch I plan to use so I can get the rest of the parts
I need ordered ASAP.


<a name="2018-02-25" aria-hidden="true"></a>
# 02/25/2018

## Order is in for Rev2

So this evening I finally got around to making the adjustments that I wanted in
revision 2.

I actually decided on one more significant change which was to add 4 additional
keys in the center of the board to reduce the wasted space. I plan to use these
as media keys (Volume up/down, play/pause, and next track) but I could see how
some folks might like having dedicated arrow keys. They also provide a decent
spot to showcase artisans for those who are into that sort of thing.

This time I did a better job at using keycap overlays to ensure that all of the
keys would fit:

{{<
    image_link
        imageText="Photo 1"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180225_205717.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/20180225_205717.png"
>}}

*I took that screenshot before I fixed the alignment so the final version is
actually centered correctly.*

Other than that, none of the changes are all that interesting so I'm not going
to go into the process here. The changes included:
* Move the two inner thumb keys back to their original spots
* Add more screwholes to the board to make it feel less flimsy
* Change the screwholes to fit M2 better because I have a lot of extra M2
  screws and standoffs lying around from Iris builds
* Add etching around where the Teensy should sit
* Add Speedo logo etching on the back

The final product:

{{<
    image_link
        imageText="Photo 2"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/rev2_speedo_plates.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/rev2_speedo_plates.png"
>}}

I'm hoping that this one feels good enough to settle on. Ideally I will use
this opportunity to learn a little more about PCB design and try to design a
PCB once I'm happy with the layout.


<a name="2018-02-27" aria-hidden="true"></a>
# 02/27/2018

## Deciding on Parts

Now that the second revision of the case file has been ordered from Ponoko, I
need to decide what parts I'm going to use for the first build.

### The Decision

* Switches: Kailh low-profile reds
* Keycaps: Blank low-profile white keycaps

I bought a low-profile switch tester set from NovelKeys and tried out all of
the switches. In terms of feel, the jades actually feel heavenly but they are
also incredibly loud and I would feel guilty using them in the presence of
others.

These days I generally like linear switches but the low-profile mixed with
linear actually doesn't feel great. I would go with browns instead but they are
out of stock on NovelKeys so it looks like I'll just suck it up and use reds.

One shitty thing about going with low-profile switches is that only one store
sells compatible keycaps and the quality leaves much to be desired. I ordered
70 of them and many of them have blemishes as shown in this picture:

{{<
    image_link
        imageText="Keycap Blemishes"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/blemishes_600x800.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/blemishes_1200x1600.jpg"
>}}

### A Close Second

There is currently a group buy in progress for some keycaps that look really
nice. The base kit is £61.50 which is $85.81 at the time of writing this. It
has the exact amount of 1u keys necessary to fill the keyboard and would look
like:

{{<
    image_link
        imageText="Pennine Speedo Keycaps"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/PennineSpeedoKeycaps.png"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/PennineSpeedoKeycaps.png"
>}}

Link:
http://www.mechsupply.co.uk/product/devlin-q-series-pennine-planck-preonic-ergodox-keyset

I've heard very good things about all of the Devlin keycaps which is what is
what tempted me the most to go this route. I also already have plenty of normal
switches so I wouldn't need to order any.

I'll probably end up getting these keycaps anyways and using them in a future build.


<a name="2018-03-07" aria-hidden="true"></a>
# 03/07/2018

## The parts arrived!

My low-profile keycaps and Kailh choc red switches arrived so I should now have everything I need to get started on the build.

{{<
    image_link
        imageText="The parts"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-07_18-50-03_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-07_18-50-03_00_1600x1200.jpg"
>}}


<a name="2018-03-10" aria-hidden="true"></a>
# 03/10/2018

## Starting the Build

### Inserting the Switches

First step was putting the switches into the plate:

{{<
    image_link
        imageText="Switches Inserted (Top)"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-21-37_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-21-37_00_1600x1200.jpg"
>}}

{{<
    image_link
        imageText="Switches Inserted (Bottom)"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-21-47_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-21-47_00_1600x1200.jpg"
>}}

### Gluing the Switches in Place

Next was to hot glue the switches in place. Because the switches wouldn't be PCB mounted, this is necessary to keep them aligned and in place:

{{<
    image_link
        imageText="Switches Glued (Top)"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-59-07_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-59-07_00_1600x1200.jpg"
>}}

{{<
    image_link
        imageText="Switches Glued (Bottom)"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-59-21_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_09-59-21_00_1600x1200.jpg"
>}}

### Soldering the Diodes

For the soldering process, I roughly followed the advice from this guide on GeekHack:

[A modern handwiring guide](https://geekhack.org/index.php?topic=87689.0)

So, first thing I did was create little loops in each diode and place them on the switch pins.

{{<
    image_link
        imageText="Diode Loop"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_16-28-28_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_16-28-28_00_1600x1200.jpg"
>}}

{{<
    image_link
        imageText="Diodes Placed"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_17-50-18_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_17-50-18_00_1600x1200.jpg"
>}}

And then I soldered them.

{{<
    image_link
        imageText="Diodes Soldered"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_18-29-09_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-10_18-29-09_00_1600x1200.jpg"
>}}

I ended the day with all of the diodes soldered but didn't want to get started on the rows yet.


<a name="2018-03-11" aria-hidden="true"></a>
# 03/11/2018

## Rows and Columns

### Rows 

With all the diodes done, I started on the rows. I roughly measured the distance between switches and then stripped the wire in segments.

Then, following the advice in the guide, I looped each diode pin around the stripped section of wire and soldered the joint.

{{<
    image_link
        imageText="First Row"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_11-46-35_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_11-46-35_00_1600x1200.jpg"
>}}

Rinse repeat:

{{<
    image_link
        imageText="Three Rows"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_13-04-02_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_13-04-02_00_1600x1200.jpg"
>}}

And again...

{{<
    image_link
        imageText="Four Rows"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_13-30-43_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_13-30-43_00_1600x1200.jpg"
>}}

Ah, finally.

{{<
    image_link
        imageText="Five Rows"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_13-53-41_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_13-53-41_00_1600x1200.jpg"
>}}

### Columns

With the rows done, I started on the columns. Again, I roughly measured the distance between the switches vertically and then stripped them accordingly.

I created the first loop on one end and soldered that to the top switch in the column. Then, I would move the sleeve close to the joint, wrap a new loop around the pin on the next switch and solder that joint. Repeat this a few more times and the column is done.

{{<
    image_link
        imageText="Column Closeup"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_14-34-20_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_14-34-20_00_1600x1200.jpg"
>}}

I only made it through 3 columns before deciding to call it a day. Making the loops for both the rows and columns is an ultra-tedious pain in the ass.

{{<
    image_link
        imageText="Done for the Day"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_14-34-10_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-11_14-34-10_00_1600x1200.jpg"
>}}


<a name="2018-03-13" aria-hidden="true"></a>
# 03/13/2018

## Rows and Columns (Cont.)

### More Columns 

Not much to say other than that I continued on the columns. As previously mentioned, they are quite annoying to do so I decided to stop after 6.

{{<
    image_link
        imageText="Progress"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-13_20-50-48_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-13_20-50-48_00_1600x1200.jpg"
>}}

For the most part I enjoy the building process but this particular task was definitely a test of my patience.


<a name="2018-03-14" aria-hidden="true"></a>
# 03/14/2018

## Rows and Columns (Cont. x 2)

### Finishing the Columns 

I finished up the columns and decided on how I wanted to wire up the middle keys:

{{<
    image_link
        imageText="Progress"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-14_19-24-58_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-14_19-24-58_00_1600x1200.jpg"
>}}


<a name="2018-03-28" aria-hidden="true"></a>
# 03/28/2018

## Destroying a Teensy 3.2

### The First Few Columns

The final step of attaching the controller was upon me so I started wiring up the columns. I was soldering them to the switches first and then to the PCB:

{{<
    image_link
        imageText="The First Few Columns"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-28_19-36-13_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-28_19-36-13_00_1600x1200.jpg"
>}}

### The Accident

I have something called benign essential tremor which causes my hands to be a bit shaky. Normally it isn't problematic but today it was.

I couldn't keep my hand steady enough and I accidentally got solder on the pins of the processing unit on my Teensy 3.2.

{{<
    image_link
        imageText="The Accident"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-28_20-02-41_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/03-28_20-02-41_00_1600x1200.jpg"
>}}

Trying to use a solder sucker to clean it up didn't help and I ended up just spreading it around even more.

So, I scrapped the chip, desoldered the few switch joints I'd completed, and ordered a Teensy 2.0.

On the bright side, the Teensy 3.2 requires setting up ChibiOS to use QMK and there's not much documentation for doing that. At least the 2.0 should make the firmware setup process easier.


<a name="2018-04-02" aria-hidden="true"></a>
# 04/02/2018

## Getting the Controller Ready

### Attaching the Wires

To avoid making the same mistake again, I decided the attach the wires to the contoller first this time.

I cut wires plenty long to reach each row/column switch, stripped one end, looped it, and then solder to the backside of the controller.

I forgot to take pictures during this process, but this is the end result:

{{<
    image_link
        imageText="Controller"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-02_22-28-01_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-02_22-28-01_00_1600x1200.jpg"
>}}

Soldering on the bottom side of the chip let me worry less about other electrical components in close proximity to the solder joints.

### Placing the Controller

With all the wires attached, I used flush cutters to clean up the solder joints and then hot glued the chip to the plate to keep it in place.


<a name="2018-04-03" aria-hidden="true"></a>
# 04/03/2018

## Finishing Up the Soldering

### Connecting the Rows

I attached the rows first. I pretty much just pulled each wire to where it need to be, cut it to length, and stripped ~0.5" off of the end.

Then I wrapped it in a loop around the joint and soldered.

{{<
    image_link
        imageText="Rows"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_18-33-39_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_18-33-39_00_1600x1200.jpg"
>}}

### Connecting the Columns

Then I did the exact same thing for the columns.

First 6 columns:

{{<
    image_link
        imageText="First Six Columns"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_19-00-47_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_19-00-47_00_1600x1200.jpg"
>}}

Then the rest:

{{<
    image_link
        imageText="All Columns"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_20-33-18_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_20-33-18_00_1600x1200.jpg"
>}}

Holy shit I'm finally done soldering:

{{<
    image_link
        imageText="Done Soldering"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_20-33-25_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_20-33-25_00_1600x1200.jpg"
>}}

### Keycaps and Firmware

Finally I put keycaps on and set up some initial firmware.

{{<
    image_link
        imageText="Keycaps"
        imageSrc="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_23-09-56_00_800x600.jpg"
        imageUrl="http://assets.cozykeys.xyz/images/builds/speedo-first-handwire/04-03_23-09-56_00_1600x1200.jpg"
>}}

