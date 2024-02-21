import csv


if __name__ == '__main__':
    with open('wordwise-dict-optimized.csv', 'r') as fin:
        reader = csv.reader(fin)
        with open('words_cn.txt') as fcn:
            with open('wordwise-dict-optimized-cn.csv', 'w') as fout:
                writer = csv.writer(fout)
                headers = next(reader)
                writer.writerow(headers)
                for row in reader:
                    row[3] = fcn.readline().strip()
                    writer.writerow(row)
