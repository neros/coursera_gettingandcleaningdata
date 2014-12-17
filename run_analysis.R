##
##How to use this script
##
##This script is self-contained to complete the course assignment.  It will download and extract the necessary files.
##(1) set the working directory setwd() as appropriate, into which files will be saved
##(2) call function: run() 
##


##
##Function: setup_files
##
##Description: will download datafiles for the Samsung Data used for course assignment analysis
##saves the downloaded file as "course_dataset.zip" and creates a subdirectory "datasets" into which the archive is unzipped.
##generates a list of filenames and paths extracted from the archive
##
##Returns: a list of name,value pairs for filename,filepath
##
setup_files <- function()
{
     zip_file <- "course_dataset.zip"
     unzip_directory <- "datasets"
     if (!file.exists(zip_file))
     {
          print("Downloading File")
          download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile=zip_file)
     }
     if (!file.exists(unzip_directory)) 
     { 
          print("Extracting Zip Files")
          unzip(zipfile=zip_file,exdir=unzip_directory,overwrite=TRUE) 
     }
     files <- list.files(path=unzip_directory, full.names = TRUE, recursive = TRUE)
     
     ##Not interested in the "Inertial Signals" datasets -- drop them out
     files <- files[grep("Inertial Signals",files,invert=TRUE)]
     nameIndex <- unlist(lapply(lapply(lapply(strsplit(files,""),function(a) { a==.Platform$file.sep }),which),max))
     filenames <- substring(files, nameIndex+1, nchar(files)-4)
     
        
     file_set <- data.frame(filename=filenames, path=files, stringsAsFactors=FALSE)
     
     return (file_set)  
}

##
##Function: load_data
##
##Description: calling setup_files() to ensure data set is available and receive the paths to the desired files.  Defining the specific
##files of interest, function loops through specified files and reads them into a data.frame object.
##
##Returns: a list() object of name,value pairs where name is the specified dataset filename and value is equal to the corresponding data.frame object
##

load_data <- function()
{
     file_set <- setup_files()
     data_list <- list()
     data_sizes <- list()
     
     dataset_names <- c("X_test","y_test","subject_test","X_train","y_train","subject_train","features","activity_labels")

     
     t1 <- proc.time()
     t <- proc.time()
     for (f in dataset_names)
     {
          p <- file_set[file_set$filename==f,2] ## retrieve path from file_set associated with name specifed in data_sizes
          d <- read.table(file=p,stringsAsFactors=FALSE,header=FALSE) ## read file into data.frame object

          
          print(paste("Loaded dataset:",f))
          print(dim(d))
          
          data_list[[f]] <- d
          
          print(proc.time() - t)
          t <- proc.time()
     }
     
     print("Completed")
     print(proc.time() - t1)
     return(data_list)
}

##
##Function: combine_data()
##
##Description: Takes the data.frame objects and combines them into a single data.frame: (1) Generates column names (2) combines test data
##objects (3) combines train data objects (4) applies consistent column names to both test and train objects (5) combines test and train into
##a single data.frame (6) adds a new column "activity_labels" to the data.frame, matching the activity_name to the activity_id
##
##Returns: A single data.frame merging together all Samsung Data objects previously read
##
combine_data <- function()
{
     ## (1)
     col_names <- paste(data_list$features[,1],"-",data_list$features[,2],sep="")
     col_names <- c("subject_id","activity_id",col_names,"is_trian")
          
     ## (2,3)
     test_data <- cbind(data_list$subject_test,data_list$y_test,data_list$X_test,rep(0,dim(data_list$X_test)[1]))
     train_data <- cbind(data_list$subject_train,data_list$y_train,data_list$X_train,rep(1,dim(data_list$X_train)[1]))

     ##(4)
     #set col names to test and trian data so rbind can succeed with identical col names
     names(test_data) <- col_names
     names(train_data) <- col_names
     
     ## (5)
     all_data <- rbind(test_data,train_data,deparse.level=0)
     
     ## (6)
     all_data$activity_label <- data_list$activity_labels[,2][match(all_data$activity_id,data_list$activity_labels[,1])]
     
     return(all_data)
}

##
##Function: extract_data
##
##Description: Subsets the columns of interest by matching column names for mean() and/or std().  Then aggregates all numeric columns by
##columns subject_id and activity_label
##
##Returns: A data.frame of size 180x68
##
extract_data <- function(all_data = combine_data())
{
     ext_data <- all_data[,c(match(c("subject_id","activity_label"),names(all_data)),grep("mean\\(\\)|std\\(\\)",names(all_data)))]
     sum_data <- ddply(ext_data, .(subject_id,activity_label), colwise(mean, .cols=function(x) class(x)=="numeric" ))
     return(sum_data)
}

##
##Function: run
##
##Description: retreives the summary dataset and then tidies it by applying rounding to each numberic column.  The data.frame is then
##written to a file in the working directory as "tidy_data.txt"
##
##Returns: none
##
run <- function()
{
     sum_data <- extract_data();
     #names(sum_data) <- sapply(names(sum_data),FUN=function(x) sprintf("%31s",x))     
     #tidy_data <- sapply(cbind(sum_data[,1:2],(round(sum_data[,3:68],6))),FUN=function(x) sprintf("%31s",x))
     tidy_data <- cbind(sum_data[,1:2],(round(sum_data[,3:68],6)))

     write.table(tidy_data,file = "tidy_output.txt", row.name=FALSE)
     print("Run Complete.  File Written as 'tidy_output.txt'")
}

