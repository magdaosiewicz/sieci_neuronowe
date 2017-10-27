function data = load_and_save_data(file_name)
    data =importdata(file_name);
    save('data.mat', 'data');
end

