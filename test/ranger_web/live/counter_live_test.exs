defmodule RangerWeb.CounterLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  @tag :good
  test "user can increase count", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view
    |> element("#increment")
    |> render_click()

    assert has_element?(view, "#count", "1")
  end

  @tag :ungood
  test "user can increase count (less effective)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    html =
      view
      |> element("#increment")
      |> render_click()

    # this just asserts that "1" is somewhere in the html.
    # ... which is a bit dumb.
    assert html =~ "1"

  end

  @tag :ungood
  test "user can increase counter (bypasses HTML - not good)", %{conn: conn} do
    {:ok, view, _} = live(conn, ~p"/counter")

    render_click(view, "increase")

    assert has_element?(view, "#count", "1")
  end


  @tag :mine
  test "user can decreease count", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view
    |> element("#decrement")
    |> render_click()

    assert has_element?(view, "#count", "-1")
  end

end
