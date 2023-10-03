use std::fs;

fn main() {
    let part_one_result = part_one_solve(parse_input("/Users/blakeastley/Projects/learning/rust/advent_of_code/2022/day_one/src/input.txt"));
    let part_two_result = part_two_solve(parse_input("/Users/blakeastley/Projects/learning/rust/advent_of_code/2022/day_one/src/input.txt"));
    println!("Part one result: {}", part_one_result);
    println!("Part two result: {}", part_two_result);
}

fn parse_input(filename: &str) -> Vec<Vec<i32>> {
    let mut input = Vec::new();
    let contents = fs::read_to_string(filename).expect("Something went wrong reading the file").trim().to_string();
    let groups = contents.split("\n\n");
    for group in groups {
        let mut group_input = Vec::new();
        let lines = group.split("\n");
        for line in lines {
            group_input.push(line.parse::<i32>().unwrap());
        }
        input.push(group_input);
    }
    return input;
}

fn part_one_solve(input: Vec<Vec<i32>>) -> i32 {
    let mut max = input[0].iter().sum();
    for elf in input {
        let current = elf.iter().sum();
        if current > max {
            max = current;
        }
    }
    return max;
}

fn part_two_solve(input: Vec<Vec<i32>>) -> i32 {
    let mut sums = input.iter().map(|x| x.iter().sum::<i32>()).collect::<Vec<i32>>();
    sums.sort();
    sums.reverse();
    sums[0] + sums[1] + sums[2]
}

#[test]
fn part_one_test() {
    let test_input = parse_input("/Users/blakeastley/Projects/learning/rust/advent_of_code/2022/day_one/src/test_input.txt");
    let result = part_one_solve(test_input);
    assert_eq!(result, 24_000);
}

#[test]
fn part_two_test() {
    let test_input = parse_input("/Users/blakeastley/Projects/learning/rust/advent_of_code/2022/day_one/src/test_input.txt");
    let result = part_two_solve(test_input);
    assert_eq!(result, 45_000);
}
