type mem_array is array(0 to 255) of std_logic_vector(50 downto 0);
signal control_mem : mem_array;

-- Example process to initialize the memory
begin
process
begin
    for i in 0 to 255 loop
        -- Example initialization logic:
        -- Assign a 51-bit value to each index of the array.
        -- Customize the logic based on your requirements.
        control_mem(i) <= std_logic_vector(to_unsigned(i, 51)); -- Example: Assign binary representation of `i` with 51 bits.
    end loop;

    -- If specific values are required for some indices:
    -- control_mem(5) <= "000000000000000000000000000000000111000000";
    -- control_mem(10) <= "000000000000000000000000000000000001110000";

    wait; -- Ends the process to prevent it from running repeatedly.
end process;
