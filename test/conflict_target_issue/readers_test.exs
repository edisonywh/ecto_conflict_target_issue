defmodule ConflictTargetIssue.ReadersTest do
  use ConflictTargetIssue.DataCase

  alias ConflictTargetIssue.Readers

  describe "reader" do
    alias ConflictTargetIssue.Readers.Reader

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def reader_fixture(attrs \\ %{}) do
      {:ok, reader} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Readers.create_reader()

      reader
    end

    test "list_reader/0 returns all reader" do
      reader = reader_fixture()
      assert Readers.list_reader() == [reader]
    end

    test "get_reader!/1 returns the reader with given id" do
      reader = reader_fixture()
      assert Readers.get_reader!(reader.id) == reader
    end

    test "create_reader/1 with valid data creates a reader" do
      assert {:ok, %Reader{} = reader} = Readers.create_reader(@valid_attrs)
      assert reader.email == "some email"
    end

    test "create_reader/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Readers.create_reader(@invalid_attrs)
    end

    test "update_reader/2 with valid data updates the reader" do
      reader = reader_fixture()
      assert {:ok, %Reader{} = reader} = Readers.update_reader(reader, @update_attrs)
      assert reader.email == "some updated email"
    end

    test "update_reader/2 with invalid data returns error changeset" do
      reader = reader_fixture()
      assert {:error, %Ecto.Changeset{}} = Readers.update_reader(reader, @invalid_attrs)
      assert reader == Readers.get_reader!(reader.id)
    end

    test "delete_reader/1 deletes the reader" do
      reader = reader_fixture()
      assert {:ok, %Reader{}} = Readers.delete_reader(reader)
      assert_raise Ecto.NoResultsError, fn -> Readers.get_reader!(reader.id) end
    end

    test "change_reader/1 returns a reader changeset" do
      reader = reader_fixture()
      assert %Ecto.Changeset{} = Readers.change_reader(reader)
    end
  end
end
