=begin
A ramp in an integer array nums is a pair (i, j) for which i < j and nums[i] <= nums[j]. The width of such a ramp is j - i.
Given an integer array nums, return the maximum width of a ramp in nums. If there is no ramp in nums, return 0.
Example 1:
Input: nums = [6,0,8,2,1,5]
Output: 4
Explanation: The maximum width ramp is achieved at (i, j) = (1, 5): nums[1] = 0 and nums[5] = 5.
Example 2:
Input: nums = [9,8,1,0,1,9,4,0,4,1]
Output: 7
Explanation: The maximum width ramp is achieved at (i, j) = (2, 9): nums[2] = 1 and nums[9] = 1.

#Problem(962): https://leetcode.com/problems/maximum-width-ramp/description/
=end

# Solution 1 (Using monotonic stack)
# @param {Integer[]} nums
# @return {Integer}
def max_width_ramp(nums)
    decreasing_stack = [0]
    for i in 1...nums.length
       decreasing_stack.append(i) if nums[decreasing_stack[-1]]>nums[i]                         
    end

    max_width = 0
    (nums.length-1).downto(0) do |j|
        until decreasing_stack.empty? || nums[decreasing_stack[-1]]>nums[j]
            max_width = [max_width, j-decreasing_stack.pop].max
        end
    end
    max_width   
end

#Solution 2 (using two pointer with preprocessing)
# @param {Integer[]} nums
# @return {Integer}
def max_width_ramp(nums)
    len = nums.length
    max_to_the_right = [0]*len
    max_to_the_right[-1] = nums[-1]
    (len-2).downto(0) do |i|
        max  = max_to_the_right[i+1]<nums[i] ? nums[i] : max_to_the_right[i+1]
        max_to_the_right[i] = max
    end
    max_width = 0
    left=0
    for right in 0...len
        while max_to_the_right[right]<nums[left]
            left+=1
        end
        max_width = [max_width, right-left].max
    end
    max_width   
end