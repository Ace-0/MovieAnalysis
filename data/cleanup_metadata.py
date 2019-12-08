import pandas as pd 


def isValidRow(row):
    if ((row['adult'] != 'TRUE' and row['adult'] != 'FALSE')
            or (not str(row['budget']).isdigit())
            or (not str(row['id']).isdigit())
            or (not isFloat(str(row['popularity'])))
            or (not str(row['revenue']).isdigit())
            or (not str(row['runtime']).isdigit())
            or (not isFloat(str(row['vote_average'])))
            or (not str(row['vote_count']).isdigit())
            ):
        return False
    else:
        return True

def isFloat(value):
    try:
        float(value)
        return True
    except ValueError:
        return False

def cleanCsvFile(inputFile, outputFile):
    # Read csv file
    data = pd.read_csv(inputFile, encoding = "ISO-8859-1") 

    # Keep only the necessary columns
    data = data[['adult', 'budget', 'id', 'imdb_id', 'original_language', 'original_title', 'popularity', 'release_date', 'revenue', 'runtime', 'status', 'title', 'vote_average', 'vote_count']]
    print(data.head())

    invalidRows = []
    idSet = set()
    # Iterate each row to remove invalid rows
    for index, row in data.iterrows():
        if (isValidRow(row)):
            # if the row is valid, check the id
            movieId = int(str(row['id']))
            if (not (movieId in idSet)):
                idSet.add(movieId)
            else:
                # if the id is duplicate, drop it later
                invalidRows.append(index)
        else:
            # if the row is invalid, drop it later
            invalidRows.append(index)
    print('Number of invalid rows: ' + str(len(invalidRows)))
    data.drop(invalidRows, inplace=True)
    data.to_csv(outputFile, sep=',', encoding='utf-8', index=False)

def main():
    cleanCsvFile('movielens.csv', 'movielens_cleaned.csv')
  
if __name__== "__main__":
    main()
