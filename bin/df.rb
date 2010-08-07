# I use Geektool to show up an image (red_x.png source: http://commons.wikimedia.org/wiki/File:Red_x.svg) on my desktop if my ssd get's to full
max_lvl = 0.7
den = `df -Pk / |grep ^/ | awk '{print $3;}'`.to_f
num = `df -Pk / |grep ^/ | awk '{print $2;}'`.to_f
state = den/num

if state > max_lvl
	# produce an error so the programm doesn't quit correctly
	puts 1/0
end
