from sport_activities_features.tcx_manipulation import TCXFile

# get all TCX files in a directory
tcx_file = TCXFile()
all_files = tcx_file.read_directory('/var/ds/tcx-test-files/running')

# iterate through files and print total distance of activities
for path in all_files:
    activity = tcx_file.read_one_file(path)
    print('total distance: ', activity['total_distance'] / 1000)
